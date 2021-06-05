defmodule SurfaceTailwind.Grid do
  @moduledoc """
  A basic **grid** layout.
  """
  use Surface.Component
  # alias SurfaceTailwind.Theme, as: T

  @doc "Css classes to propagate to the grid's top level element <div>."
  prop class, :css_class

  @doc "Number of columns"
  prop cols, :css_class, default: "grid-cols-2"
  prop gap, :css_class, default: "gap-4"
  prop margin, :css_class
  prop width, :css_class, default: "w-auto"

  @doc """
  The content to be organised by the grid rules.
  """
  slot default

  def render(assigns) do
    ~H"""
    <div class={{"grid", @cols, @gap, @margin, @width, @class}}>
      <slot/>
    </div>
    """
  end

end
