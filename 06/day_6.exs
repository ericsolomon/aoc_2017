defmodule Day6 do
  defmodule Part1 do
    def run do
      input = Day6.load_data()
      Day6.solve(input, [input], 1)
    end 
  end

  defmodule Part2 do
    def run do
      input = Day6.load_data()
      {repeat, _} = Day6.solve(input, [input], 1)
      Day6.solve(repeat, [repeat], 1)
    end
  end

  def load_data do
    File.read!("input.txt")
    |> String.trim()
    |> String.split("\t")
    |> Enum.map(&(String.to_integer(&1)))
  end

  def solve(input, seen, acc) do
    largest_index = Enum.find_index(input, &(Enum.max(input) == &1))
    new_input = distribute_blocks(List.replace_at(input, largest_index, 0), length(input), largest_index + 1, Enum.at(input, largest_index))      
    if Enum.member?(seen, new_input), do: {new_input, acc}, else: solve(new_input, seen ++ [new_input], acc + 1)
  end

  defp distribute_blocks(input, _, _, 0), do: input
  defp distribute_blocks(input, length, index, blocks) do
    distribute_blocks(List.update_at(input, rem(index, length), &(&1 + 1)), length, index + 1, blocks - 1)
  end
end