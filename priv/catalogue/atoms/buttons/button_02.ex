defmodule SurfaceTailwind.Catalogue.Button.Example02 do
  use Surface.Catalogue.Example,
    subject: SurfaceTailwind.Button,
    catalogue: SurfaceTailwind.Catalogue,
    title: "Theme",
    height: "300px",
    container: {:div, class: "flex flex-col space-y-4"}

  def render(assigns) do
    ~F"""
    <Button>Default theme (primary by default)</Button>
    <Button theme={{:primary}}>Primary theme</Button>
    <Button theme={{:secondary}}>Secondary theme</Button>
    <Button theme={{:neutral}}>Neutral theme</Button>
    """
  end
end
