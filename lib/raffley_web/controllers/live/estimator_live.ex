defmodule RaffleyWeb.EstimatorLive do
  use RaffleyWeb, :live_view

  def mount(_params, _session, socket) do
    socket = socket |> assign(tickets: 0, price: 3)

    IO.inspect(socket)

    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <div class="estimator">
      <h1>Ticket Estimator</h1>
      <section>
        <div>
          {@tickets}
        </div>
        @
        <div>
          {@price}
        </div>
        =
        <div>
          ${@tickets * @price}
        </div>
      </section>
    </div>
    """
  end
end
