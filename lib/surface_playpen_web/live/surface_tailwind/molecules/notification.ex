defmodule SurfaceTailwind.Notification do
  @moduledoc """
  A basic **breadcrumb**.
  """
  use Surface.Component
  # alias SurfaceTailwind.Theme, as: T
  alias SurfaceTailwind.Button

  # @doc "Css classes to propagate to the breadcrumbs's top level element <div>."
  # prop theme, :atom, default: :neutral
  prop class, :css_class
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

  prop action_location, :atom, values: [:bottom, :right]

  prop icon, :atom, default: nil

  prop title, :string

  @doc """
  The content to be organised by the grid rules.
  """
  slot default

  def render(assigns) do
    ~H"""
    <div class={{["border border-gray-200 shadow-lg bg-white rounded-lg max-w-sm flex flex-row space-x-3", @class]}}>
      <div :if={{@icon}} class={{ "flex-none flex flex-row justify-start text-green-500 py-4 pl-4", "items-start": (assigns[:default] != nil), "items-center": (assigns[:default] == nil)}}>
        {{icon(@icon)}}
      </div>
      <div class={{"flex-1 flex flex-col space-y-2 py-4", "pl-6": (@icon == nil), "justify-start": (assigns[:default] != nil), "justify-center": (assigns[:default] == nil)}}>
        <h2 :if={{@title}} class="text-gray-900 font-bold text-sm">{{@title}}</h2>
        <p :if={{assigns[:default]}} class="text-gray-500 font-light text-sm"><slot/></p>

        <div :if={{@action_location == :bottom}} class="flex flex-row space-x-4 pt-1">
          <Button theme={{:primary}}>Accept</Button>
          <Button theme={{:neutral}}>Decline</Button>
        </div>
      </div>
      <div class={{"flex-none flex flex-row justify-end text-gray-400 py-4 pr-4", "items-start": (assigns[:default] != nil), "items-center": (assigns[:default] == nil)}}>
        <div :if={{@action_location == :right}}>
          <Button theme={{:secondary_varient}}>Undo</Button>
        </div>
        <!-- NEED TO REFACTOR FOR TEST IF RIGHT AND ITEMS NOT MORE THAN ONE -->
        <div :if={{ (@action_location != :right)}}>{{icon(:cross)}}</div>
      </div>
      <div class="border-l border-gray-200 flex flex-col">
        <div class="h-1/2 flex items-center justify-center text-center content-center border-b border-gray-200"><Button theme={{:secondary_varient}} class="w-full">Reply</Button></div>
        <div class="h-1/2 flex items-center justify-center text-center content-center"><Button theme={{:tertiary}} class="w-full">Don't allow</Button></div>
      </div>
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

  defp icon(:tick) do
    ~E"""
    <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z" />
    </svg>
    """
  end

  defp icon(nil), do: nil




end
