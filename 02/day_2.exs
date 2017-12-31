defmodule Day2 do
  def load_data do
    File.read!("input.txt")
    |> String.trim()
    |> String.split("\n")
    |> Enum.map(&String.split(&1, "\t"))
    |> update_in([Access.all()], &for(x <- &1, do: String.to_integer(x)))
  end

  defmodule Part1 do
    def run do
      Enum.reduce(Day2.load_data(), 0, fn x, acc -> acc + (Enum.max(x) - Enum.min(x)) end)
    end
  end

  defmodule Part2 do
    def run do
      solve(Day2.load_data(), 0)
    end

    defp solve([], acc), do: acc

    defp solve([head | tail], acc) do
      solve(tail, acc_dividables(Enum.sort(head, &(&1 >= &2)), acc))
    end

    defp acc_dividables([], acc), do: acc

    defp acc_dividables([head | tail], acc) do
      acc_dividables(
        tail,
        Enum.reduce(tail, acc, &(&2 + if(rem(head, &1) == 0, do: div(head, &1), else: 0)))
      )
    end
  end
end
