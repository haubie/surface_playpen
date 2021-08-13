defmodule SurfaceTailwind.Catalogue.Grid.Example02 do
  use Surface.Catalogue.Example,
    subject: SurfaceTailwind.Grid,
    catalogue: SurfaceTailwind.Catalogue,
    title: "Three column grid",
    height: "200px"

  def render(assigns) do
    ~F"""
    <Grid cols="grid-cols-3">
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
