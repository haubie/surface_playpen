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

  @doc "Css classes to propagate down to button. Default class if no class supplied is simply _button_"
  prop class, :css_class

  prop theme, :atom, default: :primary

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
    <button
      type={{@type}}
      aria-label={{@aria_label}}
      :on-click={{@click}}
      disabled={{@disabled}}
      value={{@value}}
      class={{classes(assigns)}}>
      <slot>{{ @label }}</slot>
    </button>
    """
  end

  def classes(assigns), do: T.build_class_list(assigns, &component_theme/1)

  def component_theme(theme \\ :primary) do
    [
      alignment: "inline-flex items-center justify-center",
      padding: "px-4 py-2",
      margin: "",
      border: "border rounded-md #{T.value(theme, :main, :border)}",
      border_radius: T.value(:general, :style, :border_radius),
      text: "font-medium #{T.value(theme, :main, :contrast_text)} hover:#{T.value(theme, :dark, :contrast_text)}",
      text_size: "text-base",
      background: "#{T.value(theme, :main, :background)} hover:#{T.value(theme, :dark, :background)}",
      ring: "focus:outline-none focus:ring-4 focus:#{T.value(theme, :main, :ring)}"
    ]
  end

end
