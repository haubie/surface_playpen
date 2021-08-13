defmodule SurfaceTailwind.Catalogue.Alert.Example01 do
  use Surface.Catalogue.Example,
    subject: SurfaceTailwind.Alert,
    catalogue: SurfaceTailwind.Catalogue,
    title: "Default alert",
    height: "200px",
    container: {:div, class: "flex flex-col space-y-4"}

  def render(assigns) do
    ~F"""
    <Alert>Default alert with the info styling.</Alert>
    """
  end
end
