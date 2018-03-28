defmodule Identicon do

  def main(input) do
    input
    |> hash_input
    |> pick_color
    |> build_grid
  end

  def build_grid(%Identicon.Image{hex: hex} = _image) do
    hex
    |> Enum.chunk(3)
    |> mirror_row
  end


  def mirror_row(data) do
    Enum.map(data, fn([a, b, c])-> [a, b, c, b, a] end )
  end


  def hash_input(input) do
    hex = :crypto.hash(:md5, input)
          |> :binary.bin_to_list
    %Identicon.Image{hex: hex}
  end


  def pick_color(image = %Identicon.Image{hex: [r, g, b | _tale ]}) do
    %Identicon.Image{image | color: {r, g, b }}
  end


end
