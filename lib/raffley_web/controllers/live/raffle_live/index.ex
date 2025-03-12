defmodule RaffleyWeb.RaffleLive.Index do
  use RaffleyWeb, :live_view

  alias Raffley.Raffles
  import RaffleyWeb.CustomComponents

  def mount(_params, _session, socket) do
    socket = stream(socket, :raffles, Raffles.list_raffles())
    IO.inspect(socket.assigns.streams.raffles, label: "MOUNT")

    socket =
      attach_hook(socket, :log_stream, :after_render, fn socket ->
        IO.inspect(socket.assigns.streams.raffles, label: "AFTER_RENDER")
        socket
      end)

    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <div class="raffle-index">
      <.banner :let={name}>
        <.icon name="hero-sparkles-solid" /> Mystery Raffle Coming Soon! {name}
        <:details :let={vibe}>
          To Be Revealed Tomorrow {vibe}
        </:details>
        <:details>
          Any guesses?
        </:details>
      </.banner>
      <div class="raffles" id="raffles" phx-update="stream">
        <.raffle_card :for={{dom_id, raffle} <- @streams.raffles} raffle={raffle} id={dom_id} />
      </div>
    </div>
    """
  end

  attr :raffle, Raffley.Raffles.Raffle, required: true
  attr :id, :string, required: true

  def raffle_card(assigns) do
    ~H"""
    <.link navigate={~p"/raffles/#{@raffle.id}"} id={@id}>
      <div class="card">
        <img src={@raffle.image_path} />
        <h2>
          {@raffle.prize}
        </h2>
        <div class="details">
          <div class="price">
            ${@raffle.ticket_price} / ticket
          </div>
          <.badge status={@raffle.status} class="animate-spin" />
        </div>
      </div>
    </.link>
    """
  end
end
