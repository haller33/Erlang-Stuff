defmodule ExMon.Player do
  @max_life 100
  @required_keys [:life, :moves, :name]
  @enforce_keys @required_keys
  defstruct @required_keys

  def build(name, move_rnd, move_avg, move_heal) do
    %ExMon.Player{
      life: @max_life,
      moves: %{
        move_avg: move_avg,
        move_rnd: move_rnd,
        move_heal: move_heal
      },
      name: name
    }
  end
end
