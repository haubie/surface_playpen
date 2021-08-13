defmodule SurfaceTailwind.Catalogue.Alert.Breadcrumb04 do
  use Surface.Catalogue.Example,
    subject: SurfaceTailwind.Breadcrumb,
    catalogue: SurfaceTailwind.Catalogue,
    title: "Full width",
    height: "200px",
    container: {:div, class: "flex flex-col space-y-4"}

  def render(assigns) do
    ~F"""
    <Breadcrumb crumbs={[%{name: "About", href: "/about"}, %{name: "Team", href: "/about/team"}, %{name: "Marius"}]}
                separator="divider" bordered={true} full_width={true} />
    """
  end
end
