defmodule Day7 do
  defmodule Part1 do
    def run do
      find_root(Day7.load_data())
    end

    defp find_root(input) do
      Map.keys(input) -- Enum.reduce(input, [], &(&2 ++ elem(elem(&1, 1), 1)))
    end
  end

  # NOT WORKING. Need to figure out how to narrow down to the defective tower
  defmodule Part2 do
    def run do
      balance(Day7.load_data())
    end

    defp balance(input) do
      foo =
        Enum.reduce(input, %{}, fn x, acc ->
          Map.put(acc, elem(x, 0), calc_weight(input, elem(elem(x, 1), 1), elem(elem(x, 1), 0)))
        end)

      Enum.map(input, fn {k, v} ->
        {weight, children} = v
        {k, {weight, Enum.map(children, &to_string(Map.get(foo, &1)))}}
      end)
      |> Enum.filter(&(Enum.count(Enum.uniq(elem(elem(&1, 1), 1))) > 1))
    end

    # Given a list of children, this recursively traverses each child and adds its weight plus its children's weight.
    # You end up with the total tower weight for a given program, including itself
    defp calc_weight(_, [], acc), do: acc

    defp calc_weight(input, [child | rest], acc) do
      tower_weight =
        Enum.reduce(elem(Map.get(input, child), 1), elem(Map.get(input, child), 0), fn x, acc ->
          calc_weight(input, elem(Map.get(input, x), 1), acc)
        end)

      calc_weight(input, rest, acc + tower_weight)
    end
  end

  # %{"name" => {12, ["child1", "child2"]}}
  def load_data do
    File.read!("input.txt")
    |> String.trim()
    |> String.split("\n")
    |> Enum.reduce(%{}, fn line, acc ->
      [name, weight | children] = Regex.split(~r{(\s+|\(|\)|\s*->\s*|,\s*)}, line, trim: true)
      Map.put(acc, name, {String.to_integer(weight), children})
    end)
  end
end
