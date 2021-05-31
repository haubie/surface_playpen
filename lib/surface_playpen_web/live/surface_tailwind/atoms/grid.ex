defmodule SurfaceTailwind.Grid do
  @moduledoc """
  A basic **grid** layout.
  """
  use Surface.Component
  # alias SurfaceTailwind.Theme, as: T

  @doc "Css classes to propagate to the grid's top level element <div>."
  prop class, :css_class

  @doc "Number of columns"
  prop cols, :number, default: 1
  prop gap, :number, default: 0
  prop width, :css_class, default: "w-full"

  prop xs, :number, default: 1
  prop sm, :number, default: 2
  prop md, :number, default: 3
  prop lg, :number, default: 4
  prop xl, :number, default: 5
  prop xxl, :number, default: 6

  prop margin, :css_class

  @doc """
  The content to be organised by the grid rules.
  """
  slot default

  def render(assigns) do
    ~H"""
    <div class="grid
                grid-cols-{{@cols}} xs:grid-cols-{{@xs}} sm:grid-cols-{{@sm}} md:grid-cols-{{@md}} lg:grid-cols-{{@lg}} xl:grid-cols-{{@xl}} xxl:grid-cols-{{@xxl}}
                gap-{{@gap}}
                {{@margin}}
                {{@class}}">
      <slot></slot>
    </div>
    """
  end

end
