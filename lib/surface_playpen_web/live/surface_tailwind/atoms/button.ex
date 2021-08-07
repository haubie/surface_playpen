defmodule SurfaceTailwind.Button do
  @moduledoc """
  The standard **button**
  """
  use Surface.Component
  alias SurfaceTailwind.Theme, as: T

  @doc """
  The button type, defaults to "button", mainly used for instances like modal X to close style buttons
  where you don't want to set a type at all. Setting to nil makes button have no type.
  """
  prop type, :string, default: "button"

  @doc "The label of the button, when no content (default slot) is provided"
  prop label, :string

  @doc "The aria label for the button"
  prop aria_label, :string

  @doc "The value for the button"
  prop value, :string

  @doc "Set the button as disabled preventing the user from interacting with the control"
  prop disabled, :boolean

  @doc "Triggered on click"
  prop click, :event

  @doc "Additional CSS classes to append to the button element."
  prop class, :css_class

  @doc """
  Used to set which styles are used from the global theme definition. The default is :primary.
  Depending on your global theme setup, you may also have the additional styles:
    :secondary, :secondary_varient, :neutral, :tertiary
    :info, :warning, :error, :success

  The :disabled global theme is applied if the button has the property disabled=true
  """
  prop theme, :atom, default: :primary

  prop alignment, :css_class
  prop padding, :css_class
  prop margin, :css_class
  prop border, :css_class
  prop border_hover, :css_class
  prop border_radius, :css_class
  prop text, :css_class
  prop text_size, :css_class
  prop background, :css_class
  prop background_hover, :css_class
  prop ring, :css_class


  @doc """
  The content of the generated `<button>` element. If no content is provided,
  the value of property `label` is used instead.
  """
  slot default

  def render(assigns) do
    ~H"""
    <button
      type={{@type}}
      aria-label={{@aria_label}}
      :on-click={{@click}}
      disabled={{@disabled}}
      value={{@value}}
      class={{classes(assigns), @class}}>
      <slot>{{ @label }}</slot>
    </button>
    """
  end

  def classes(assigns), do: T.build_class_list(assigns, &component_theme/1)

  def component_theme(theme \\ :primary) do
    [
      alignment: "inline-flex items-center justify-center",
      padding: "px-4 py-2",
      border: ["border", T.value(theme, :border)],
      border_radius: T.value(:general, :border_radius),
      border_hover: T.value(theme, :border_hover),
      text: ["font-medium", T.value(theme, :contrast_text), T.value(theme, :contrast_text_hover)],
      text_size: "text-sm",
      background: T.value(theme, :background),
      background_hover: T.value(theme, :background_hover),
      ring: T.value(theme, :ring),
      animation: "transition duration-200 ease-in-out"
    ]
  end

end
