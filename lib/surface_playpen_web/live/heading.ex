defmodule SurfacePlaypenWeb.Heading do
  use Surface.Component

  prop title, :string, required: true

  @impl Phoenix.LiveComponent
  def render(assigns) do
    ~F"""
    <h1>{@title}</h1>
    """
  end
end
