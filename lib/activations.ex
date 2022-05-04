defmodule Activation do
  def step(val) do
    if val > 0, do: 1, else: 0
  end

  def relu(val) do
    if val > 0, do: val, else: 0
  end
end
