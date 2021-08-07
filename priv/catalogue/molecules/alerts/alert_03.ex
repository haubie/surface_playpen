defmodule SurfaceTailwind.Catalogue.Alert.Example03 do
  use Surface.Catalogue.Example,
    subject: SurfaceTailwind.Alert,
    catalogue: SurfaceTailwind.Catalogue,
    title: "Overriding default styles",
    height: "250px",
    container: {:div, class: "flex flex-col space-y-4"}

  def render(assigns) do
    ~F"""
    <Alert border="border-8 border-blue-900 border-opacity-40"
           background="bg-gradient-to-r from-red-100 to-indigo-100"
           text="text-blue-900 font-semibold">
           Error alert styling with overriding
           of Tailwind CSS border classes.
           <a href="#"
              class="inline-block underline hover:no-underline">
              More info &rarr;
           </a>
    </Alert>
    """
  end
end
