defmodule SurfaceTailwind.Catalogue.Alert.Example02 do
  use Surface.Catalogue.Example,
    subject: SurfaceTailwind.Alert,
    catalogue: SurfaceTailwind.Catalogue,
    title: "Alert types",
    height: "350px",
    container: {:div, class: "flex flex-col space-y-4"}

  def render(assigns) do
    ~F"""
    <Alert type={:info}>Info alert styling.</Alert>

    <Alert type={:warning}>Warning alert styling.</Alert>

    <Alert type={:error}>Error alert styling.</Alert>
    """
  end
end
