defmodule SurfaceTailwind.Notification do
  @moduledoc """
  A **notification** component. Used primarily for displaying dynamic notifications, such as from real time events.


  """
  use Surface.Component
  alias SurfaceTailwind.Theme, as: T
  alias SurfaceTailwind.{Button, Icon}

  @doc "CSS classes to appdend to top level element `<div>`."
  prop class, :css_class

  @doc "The primary action. An action button will only show if this value is not empty. An action is optional."
  prop action, :event

  @doc "The secondary action. An action button will only show if this value is not empty."
  prop secondary_action, :event

  @doc """
       Sets where action buttons should show.

       The options for action_location are:

       * `:bottom` - places the action button(s) at the bottom of the notification.
       * `:right` - places the action buttons to the right, in a MacOS-style.
       * `:inline` - places a single button inline.

       The default is `:inline`.
       """
  prop action_location, :atom, values: [:bottom, :right, :inline], default: :inline

  @doc "An optional icon can be shown."
  prop icon, :string, default: nil

  @doc "The title of the notification. This can also be the notification message for small notifications."
  prop title, :string


  @doc """
  Used to set which styles are used from the global theme definition. The default is :primary.
  Depending on your global theme setup, you may also have the additional styles:
    :secondary, :secondary_varient, :neutral, :tertiary
    :info, :warning, :error, :success

  If `:alert` is passed as the theme, the colours from `:error` will be used.

  The theme value is used to style the primary button and the icon colour.
  """
  prop theme, :atom, default: :primary

  @doc """
  The content to be organised by the grid rules.
  """
  slot default

  def render(assigns) do
    ~H"""
    <div class={{["border border-gray-200 shadow-lg bg-white rounded-lg max-w-sm flex flex-row space-x-3 overflow-hidden", @class]}}>
      <div :if={{@icon}} class={{ "flex-none flex flex-row justify-start py-4 pl-4", icon_color(@theme), "items-start": (assigns[:default] != nil), "items-center": (assigns[:default] == nil)}}>
        <Icon icon="{{@icon}}" w="w-6" h="h-6"/>
      </div>
      <div class={{"flex-1 flex flex-col space-y-2 py-4", "pl-6": (@icon == nil), "justify-start": (assigns[:default] != nil), "justify-center": (assigns[:default] == nil)}}>
        <h2 :if={{@title}} class="text-gray-900 font-bold text-sm">{{@title}}</h2>
        <p :if={{assigns[:default]}} class="text-gray-500 font-light text-sm"><slot/></p>

        <div :if={{@action_location == :bottom}} class="flex flex-row space-x-4 pt-1">
          <Button theme={{classes_for_primary_button(@theme)}} click={{@action}} >Accept</Button>
          <Button :if={{@secondary_action}} theme={{:neutral}} click={{@secondary_action}} >Decline</Button>
        </div>
      </div>
      <div class={{"flex-none flex flex-row justify-end text-gray-400 py-4 pr-4", "items-start": (assigns[:default] != nil), "items-center": (assigns[:default] == nil)}}>
        <div :if={{@action_location == :inline}}>
          <Button theme={{:secondary_varient}} click={{@action}} class="mr-2">Undo</Button>
        </div>
        <!-- NEED TO REFACTOR FOR TEST IF RIGHT AND ITEMS NOT MORE THAN ONE -->
        <Icon :if={{ (@action_location != :right)}} icon="cross" w="w-6" h="h-6"/>
      </div>
      <div :if={{@action_location == :right}} class="border-l border-gray-200 flex flex-col">
        <div class={{"flex items-center justify-center text-center content-center", "border-b border-gray-200 h-1/2": (@secondary_action != nil), "h-full": (@secondary_action == nil)}}><Button click={{@action}} theme={{:secondary_varient}} class="w-full h-full ring-inset" border_radius={{"rounded-none rounded-tr-lg", "rounded-br-lg": (@secondary_action == nil)}}>Reply</Button></div>
        <div :if={{@secondary_action}} class="h-1/2 flex items-center justify-center text-center content-center"><Button theme={{:tertiary}} class="w-full h-full ring-inset" border_radius="rounded-none rounded-br-lg">Don't allow</Button></div>
      </div>
    </div>
    """
  end

  defp classes_for_primary_button(:alert), do: :error
  defp classes_for_primary_button(theme), do: theme

  defp icon_color(:alert), do: T.value(:error, :text)
  defp icon_color(theme), do: T.value(theme, :text)


end
