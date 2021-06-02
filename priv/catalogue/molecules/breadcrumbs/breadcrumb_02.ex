defmodule SurfaceTailwind.Catalogue.Alert.Breadcrumb02 do
  use Surface.Catalogue.Example,
    subject: SurfaceTailwind.Breadcrumb,
    catalogue: SurfaceTailwind.Catalogue,
    title: "Colourful",
    height: "200px",
    container: {:div, class: "flex flex-col space-y-4"}

  def render(assigns) do
    ~H"""
    <Breadcrumb crumbs={{[%{name: "About", href: "/about"}, %{name: "Team", href: "/about/team"}, %{name: "Marius"}]}}
                bordered=true border="border border-blue-600" border_radius="rounded-full"
                shadow="shadow-none" text="text-blue-600"
                background="bg-gradient-to-tl from-red-50 to-indigo-50"
                separator_color="text-pink-400" />
    """
  end
end
