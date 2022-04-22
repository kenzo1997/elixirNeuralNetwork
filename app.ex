defmodule App do
  defp inner(inputs, weights, bias, func) do
    Enum.zip(inputs, weights)
    |> Enum.map(fn {i, w} -> i * w end)
    |> Enum.reduce(fn(val, acc) -> val + acc end)
    |> Kernel.+(bias)
    |> func.()
  end

  def forward_pass(inputs, weights, bias, func) do
    Enum.zip(weights, bias)
    |> Enum.map(fn {w, b} ->
      inner(inputs, w, b, func)
    end)
  end
end
