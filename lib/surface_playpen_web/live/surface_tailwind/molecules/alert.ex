defmodule SurfaceTailwind.Alert do
  @moduledoc """
  An **alert**
  """

  use Surface.Component
  alias SurfaceTailwind.Theme, as: T

  @doc """
  The alert type, defaults to :info
  """
  prop type, :string, default: :info

  @doc "The label of the alert, when no content (default slot) is provided"
  prop label, :string

  @doc "The aria label for the alert"
  prop aria_label, :string

  @doc "The value for the alert"
  prop value, :string

  # @doc "Set the button as disabled preventing the user from interacting with the control"
  # prop disabled, :boolean

  @doc "Triggered on click"
  prop click, :event

  @doc "Css classes to propagate down to button. Default class if no class supplied is simply _button_"
  prop class, :css_class

  prop theme, :atom, default: :primary

  prop size, :css_class
  prop alignment, :css_class
  prop padding, :css_class
  prop margin, :css_class
  prop border, :css_class
  prop text, :css_class
  prop text_size, :css_class
  prop background, :css_class
  prop ring, :css_class

  @doc """
  The content of the generated `<button>` element. If no content is provided,
  the value of property `label` is used instead.
  """
  slot default

  def render(assigns) do
    ~H"""
    <div
      aria-label={{@aria_label}}
      :on-click={{@click}}
      value={{@value}}
      class={{classes(assigns)}}>
      <div class="w-12">{{@type}}</div>
      <div class="flex-1">
      <slot>{{ @label }}</slot>
      </div>
      <div class="w-6">X</div>
    </div>
    """
  end

  def classes(assigns) do
    # Alert theme is selected based on the alert type parameter, rather than using the theme parameter
    # E.g. <Alert type={{:error}}>Error message text here.</Alert>
    assigns         = Map.put(assigns, :theme, assigns.type)

    T.build_class_list(assigns, &component_theme/1)
  end

  # def classes(assigns), do: T.build_class_list(assigns, &component_theme/1)

  # For the component author to define the component's theme.
  # The first parameter is an atom representing a theme definition at the global level.
  # By default the :primary theme is used if no value is passed to it.
  # A component author can decide which properies from the global theme definition that is included in this component.
  # This done by calling SurfaceTailwind.Theme.value/3 function which takes the pallet variable as the first parameter and sub-theme
  # keys as the second (e.g. :main or :dark or :light or :info, etc) and the key represnting the value you want to access as the final
  # parameter (e.g. :border, :contrast_text, :background, etc). Usually this will return one or more Tailwind CSS classes.
  def component_theme(theme \\ :primary) when is_atom(theme) do
    [
      size: "w-full",
      alignment: "inline-flex items-center justify-left",
      padding: "px-4 py-5",
      margin: "",
      border: "border #{T.value(theme, :main, :border)}",
      text: "font-semibold #{T.value(theme, :main, :contrast_text)}",
      text_size: "text-base",
      background: "#{T.value(theme, :main, :background)} hover:#{T.value(theme, :dark, :background)}",
      ring: "focus:outline-none focus:ring-4 focus:#{T.value(theme, :main, :ring)}",
      icon: T.value(theme, :main, :icon)
    ]
  end
end
