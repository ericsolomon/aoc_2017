defmodule Day4 do
  def load_data do
    File.read!("input.txt")
    |> String.trim()
    |> String.split("\n")
    |> Enum.map(&(String.split(&1, " ")))
  end
  
  defmodule Part1 do
    def run do
      Enum.reduce(Day4.load_data(), 0, &(&2 + if length(Enum.uniq(&1)) == length(&1), do: 1, else: 0))   
    end
  end

  defmodule Part2 do
    def run do
      Day4.load_data()
      |> update_in([Access.all()], &(for x <- &1, do: x |> String.split("") |> Enum.sort |> List.to_string))
      |> Enum.reduce(0, &(&2 + if length(Enum.uniq(&1)) == length(&1), do: 1, else: 0))
    end
  end
end
