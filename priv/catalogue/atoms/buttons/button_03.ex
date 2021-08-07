defmodule SurfaceTailwind.Catalogue.Button.Example03 do
  use Surface.Catalogue.Example,
    subject: SurfaceTailwind.Button,
    catalogue: SurfaceTailwind.Catalogue,
    title: "Disabled button",
    height: "90px"

  def render(assigns) do
    ~F"""
    <Button disabled={true}>Disabled</Button>
    """
  end
end
