defmodule SurfaceTailwind.Catalogue.Alert.Breadcrumb05 do
  use Surface.Catalogue.Example,
    subject: SurfaceTailwind.Breadcrumb,
    catalogue: SurfaceTailwind.Catalogue,
    title: "Text colours",
    height: "200px",
    container: {:div, class: "flex flex-col space-y-4"}

  def render(assigns) do
    ~F"""
    <Breadcrumb crumbs={ [%{name: "About", href: "/about"}, %{name: "Team", href: "/about/team"}, %{name: "Marius"}] }
                text="text-blue-500 hover:text-blue-900"/>

    <Breadcrumb crumbs={[%{name: "About", href: "/about"}, %{name: "Team", href: "/about/team"}, %{name: "Marius"}]}
                text="text-pink-500 hover:text-pink-900"/>

    <Breadcrumb crumbs={[%{name: "About", href: "/about"}, %{name: "Team", href: "/about/team"}, %{name: "Marius"}]}
                text="text-green-500 hover:text-green-900"/>
    """
  end
end
