defmodule SurfaceTailwind.Catalogue.Alert.Breadcrumb01 do
  use Surface.Catalogue.Example,
    subject: SurfaceTailwind.Breadcrumb,
    catalogue: SurfaceTailwind.Catalogue,
    title: "Types of separators",
    height: "300px",
    container: {:div, class: "flex flex-col space-y-4"}

  def render(assigns) do
    ~H"""
    <Breadcrumb crumbs={{[%{name: "About", href: "/about"}, %{name: "Team", href: "/about/team"}, %{name: "Marius"}]}}/>
    <Breadcrumb crumbs={{[%{name: "About", href: "/about"}, %{name: "Team", href: "/about/team"}, %{name: "Marius"}]}} separator="cheveron"/>
    <Breadcrumb crumbs={{[%{name: "About", href: "/about"}, %{name: "Team", href: "/about/team"}, %{name: "Marius"}]}} separator="slash"/>
    <Breadcrumb crumbs={{[%{name: "About", href: "/about"}, %{name: "Team", href: "/about/team"}, %{name: "Marius"}]}} separator="divider"/>
    """
  end
end
