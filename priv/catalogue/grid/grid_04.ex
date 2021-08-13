defmodule SurfaceTailwind.Catalogue.Grid.Example04 do
  use Surface.Catalogue.Example,
    subject: SurfaceTailwind.Grid,
    catalogue: SurfaceTailwind.Catalogue,
    title: "Adjusting gap between elements",
    height: "200px"

  def render(assigns) do
    ~F"""
    <Grid gap="gap-1" cols="grid-cols-3">
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
