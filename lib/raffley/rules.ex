defmodule Raffley.Rules do
  def list_rules do
    [
      %{
        id: 1,
        text: "Be kind and respectful to other participants"
      },
      %{
        id: 2,
        text: "Keep your ticket safe - you'll need it to claim any prize"
      },
      %{
        id: 3,
        text: "Make sure your contact details are up to date"
      },
      %{
        id: 4,
        text: "Have fun and enjoy the excitement of the raffle!"
      }
    ]
  end

  def get_rule(id) when is_integer(id) do
    Enum.find(list_rules(), fn rule -> rule.id == id end)
  end

  def get_rule(id) when is_binary(id) do
    id |> String.to_integer() |> get_rule()
  end
end
