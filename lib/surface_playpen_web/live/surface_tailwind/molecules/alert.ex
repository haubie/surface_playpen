defmodule SurfaceTailwind.Alert do
  @moduledoc """
  An **alert**
  """

  use Surface.Component
  alias SurfaceTailwind.Theme

  @component_name :alert
  @themeable_props [:size, :alignment, :padding, :margin, :border, :text, :text_size, :background, :ring]

  @doc """
  The button type, defaults to "button", mainly used for instances like modal X to close style buttons
  where you don't want to set a type at all. Setting to nil makes button have no type.
  """
  prop type, :string, default: :info

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
      disabled={{@disabled}}
      value={{@value}}
      class={{classes(assigns), @class}}>
      <div class="w-12">{{@type}}</div>
      <div class="flex-1">
      <slot>{{ @label }}</slot>
      </div>
      <div class="w-6">X</div>
    </div>
    """
  end

  def classes(assigns) do
    assigns = Map.put(assigns, :theme, assigns.type)

    Theme.classes(assigns, @component_name, @themeable_props)
  end

end
