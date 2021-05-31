defmodule SurfaceTailwind.Catalogue.Button.Example01 do
  use Surface.Catalogue.Example,
    subject: SurfaceTailwind.Button,
    catalogue: SurfaceTailwind.Catalogue,
    title: "Label and slot",
    height: "90px"

  def render(assigns) do
    ~H"""
    <Button label="Label"/>
    <Button>Slot</Button>
    """
  end
end
