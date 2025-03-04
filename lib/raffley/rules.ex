defmodule Raffley.Rules do
  def list_rules do
    [
      %{
        id: 1,
        text: "Participate in the raffle by purchasing a ticket."
      },
      %{
        id: 2,
        text: "Each ticket costs $10."
      },
      %{
        id: 3,
        text: "The raffle will be held on [DATE]."
      },
      %{
        id: 4,
        text: "The winner will be chosen at random from all the tickets sold."
      }
    ]
  end
end
