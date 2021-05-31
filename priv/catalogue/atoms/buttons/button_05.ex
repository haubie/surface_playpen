defmodule SurfaceTailwind.Catalogue.Button.Example05 do
  use Surface.Catalogue.Example,
    subject: SurfaceTailwind.Button,
    catalogue: SurfaceTailwind.Catalogue,
    title: "Overriding component styles in props",
    height: "400px"

  def render(assigns) do
    ~H"""
    <Button background="bg-green-200 hover:bg-green-900"
            text="text-green-900 hover:text-white"
            class="my-4">
            Overiding styles in props
    </Button>

    <Button theme={{:secondary}}
            background="bg-red-200 hover:bg-red-900"
            text="text-red-900 hover:text-white"
            class="my-4">
            Apply secondary theme and override styles in props
    </Button>
    """
  end
end
