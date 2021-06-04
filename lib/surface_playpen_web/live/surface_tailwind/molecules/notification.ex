defmodule SurfaceTailwind.Notification do
  @moduledoc """
  A basic **breadcrumb**.
  """
  use Surface.Component
  # alias SurfaceTailwind.Theme, as: T

  # @doc "Css classes to propagate to the breadcrumbs's top level element <div>."
  # prop theme, :atom, default: :neutral
  # prop class, :css_class
  # prop background, :css_class
  # prop separator, :string, default: "cheveron", values: ["cheveron", "slash", "divider"]
  # prop separator_color, :css_class, default: "text-gray-200"
  # prop full_width, :boolean, default: false
  # prop padding, :css_class
  # prop margin, :css_class
  # prop border, :css_class
  # prop bordered, :boolean, default: false
  # prop border_radius, :css_class
  # prop shadow, :css_class
  # prop text, :css_class
  # prop alignment, :css_class, default: "inline-flex flex-row items-center"

  # prop crumbs, :list, required: true

  prop title, :string

  @doc """
  The content to be organised by the grid rules.
  """
  slot default

  def render(assigns) do
    ~H"""
    <div class="border border-gray-200 shadow-lg bg-color-white p-4 rounded-lg max-w-sm space-y-2">
      <h2 :if={{@title}} class="text-gray-900 font-bold text-sm">{{@title}}</h2>
      <p class="text-gray-500 font-light text-sm"><slot/></p>
    </div>
    """
  end


  defp icon(:cross) do
    ~E"""
    <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
    </svg>
    """
  end




end
