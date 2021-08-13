defmodule SurfaceTailwind.Catalogue.Alert.Breadcrumb03 do
  use Surface.Catalogue.Example,
    subject: SurfaceTailwind.Breadcrumb,
    catalogue: SurfaceTailwind.Catalogue,
    title: "Add theme border",
    height: "200px",
    container: {:div, class: "flex flex-col space-y-4 bg-gray-50 py-4 px-2"}

  def render(assigns) do
    ~F"""
    <Breadcrumb crumbs={[%{name: "About", href: "/about"}, %{name: "Team", href: "/about/team"}, %{name: "Marius"}]}
                bordered={true} background="bg-white" />

    <Breadcrumb crumbs={[%{name: "About", href: "/about"}, %{name: "Team", href: "/about/team"}, %{name: "Marius"}]}
    separator="divider"
    background="bg-white"
    bordered={true} />
    """
  end
end
