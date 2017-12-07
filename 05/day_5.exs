defmodule Day5 do
  def load_data do
    File.read!("input.txt")
    |> String.trim
    |> String.split("\n")
    |> Enum.map(&(String.to_integer(&1)))
  end

  # < 30 seconds
  defmodule Part1 do
    def run do
      input = Day5.load_data()
      solve(input, length(input), 0, 0)
    end

    defp solve(list, len, index, acc) do
      if index >= len or index < 0 do
        acc
      else
        solve(List.update_at(list, index, &(&1 + 1)), len, index + Enum.at(list, index), acc + 1)
      end
    end
  end

  # Super slow (several minutes), needs optimizing
  defmodule Part2 do
    def run do
      input = Day5.load_data()
      solve(input, length(input), 0, 0)
    end

    defp solve(list, len, index, acc) do
      if index >= len or index < 0 do
        acc
      else
        new_index = index + Enum.at(list, index)
        solve(List.update_at(list, index, &(&1 + if new_index - index >= 3, do: -1, else: 1)), len, new_index, acc + 1)
      end
    end 
  end
end
