defmodule SurfaceTailwind.Catalogue.Grid.Example01 do
  use Surface.Catalogue.Example,
    subject: SurfaceTailwind.Grid,
    catalogue: SurfaceTailwind.Catalogue,
    title: "Default grid is 2 columns with a gap of 4 between items",
    height: "200px"

  def render(assigns) do
    ~H"""
    <Grid>
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
