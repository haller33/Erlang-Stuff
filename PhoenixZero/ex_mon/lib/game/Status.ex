defmodule ExMon.Game.Status do

  alias ExMon.Game
  
  def print_game_round_message do
    IO.puts("\n====== The game has Started ======")
    IO.inspect(Game.info())
    IO.puts("---------------------")
  end
end  
