defmodule NeuralNetwork do
  alias App
  alias Activation
  alias CostFunction
  @moduledoc """
  Documentation for `NeuralNetwork`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> NeuralNetwork.hello()
      :world

  """
  def start do
    inputs = [1,2,3]

    weights = [
      [1,2,3],
      [4,5,6],
      [8,9,2]
    ]

    bias = [2, 5, 1]

    res = App.forward_pass(inputs, weights, bias, &Activation.relu/1)
    Enum.map(res, fn x -> IO.puts(x) end)
  end
end
