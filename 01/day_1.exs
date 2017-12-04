defmodule Part1 do
  def run() do
    input = File.read!("input.txt") |> String.trim |> String.graphemes
    solve(input ++ [hd(input)], 0)
  end

  defp solve([], acc), do: acc
  defp solve([x, x | tail], acc), do: solve([x | tail], String.to_integer(x) + acc)
  defp solve([_ | tail], acc), do: solve(tail, acc)
end

defmodule Part2 do
  def run() do
    input = File.read!("input.txt") |> String.trim |> String.graphemes
    solve(Enum.zip(input, Enum.slice(input ++ input, div(length(input), 2), length(input))), 0)
  end

  defp solve([], acc), do: acc
  defp solve([{x, x} | tail], acc), do: solve([x | tail], String.to_integer(x) + acc)
  defp solve([_ | tail], acc), do: solve(tail, acc)
end
