defmodule SurfaceTailwind.Catalogue.Grid.Example03 do
  use Surface.Catalogue.Example,
    subject: SurfaceTailwind.Grid,
    catalogue: SurfaceTailwind.Catalogue,
    title: "Responsive varients",
    height: "200px"

  def render(assigns) do
    ~F"""
    <Grid cols="grid-cols-2 md:grid-cols-4">
      <div class="bg-pink-100">1</div>
      <div class="bg-pink-100">2</div>
      <div class="bg-pink-100">3</div>
      <div class="bg-pink-100">4</div>
      <div class="bg-pink-100">5</div>
      <div class="bg-pink-100">6</div>
    </Grid>
    """
  end
end
