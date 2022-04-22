defmodule Activation do
  def step(val) do
    if val > 0, do: 1, else: 0
  end

  def relu(val) do
    if val > 0, do: val, else: 0
  end
end


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


#-------------------------------------------------------------------------------
inputs = [1,2,3]

weights = [
  [1,2,3],
  [4,5,6],
  [8,9,2]
]

bias = [2, 5, 1]

res = App.forward_pass(inputs, weights, bias, &Activation.relu/1)
Enum.map(res, fn x -> IO.puts(x) end)


#-------------------------------------------------------------------------------
