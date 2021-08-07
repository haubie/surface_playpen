defmodule SurfaceTailwind.Alert do
  @moduledoc """
  An **alert**
  """

  use Surface.Component
  alias SurfaceTailwind.Theme, as: T

  @doc """
  The alert type, defaults to :info
  """
  prop type, :string, default: :info, values: [:info, :error, :warning]

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

  # prop theme, :atom, default: :primary

  prop size, :css_class
  prop alignment, :css_class
  prop padding, :css_class
  prop margin, :css_class
  prop border, :css_class
  prop text, :css_class
  prop text_size, :css_class
  prop background, :css_class
  prop ring, :css_class
  prop shadow, :css_class

  @doc """
  The content of the generated `<button>` element. If no content is provided,
  the value of property `label` is used instead.
  """
  slot default

  def render(assigns) do
    ~F"""
    <div
      aria-label={@aria_label}
      :on-click={@click}
      value={@value}
      class={classes(assigns),"space-x-3"}>
        <div class="w-12 h-12
                    rounded-full
                    bg-white bg-opacity-20
                    flex flex-col
                    justify-center items-center">
                    {icon(@type)}
        </div>
        <div class="flex-1">
          <#slot>{@label}</#slot>
        </div>
        <div class="w-8 opacity-60">{icon(:cross)}</div>
    </div>
    """
  end

  def classes(assigns) do
    # Alert theme is selected based on the alert type parameter, rather than using the theme parameter
    # E.g. <Alert type={{:error}}>Error message text here.</Alert>
    assigns         = Map.put(assigns, :theme, assigns.type)

    T.build_class_list(assigns, &component_theme/1)
  end

  # For the component author to define the component's theme.
  # The first parameter is an atom representing a theme definition at the global level.
  # By default the :primary theme is used if no value is passed to it.
  # A component author can decide which properies from the global theme definition that is included in this component.
  # This done by calling SurfaceTailwind.Theme.value/3 function which takes the pallet variable as the first parameter and sub-theme
  # keys as the second (e.g. :main or :dark or :light or :info, etc) and the key represnting the value you want to access as the final
  # parameter (e.g. :border, :contrast_text, :background, etc). Usually this will return one or more Tailwind CSS classes.
  def component_theme(theme) do
    [
      size: "w-full",
      alignment: "inline-flex items-center justify-left",
      padding: "px-3 py-3",
      border: ["border", T.value(theme, :border)],
      border_radius: T.value(:general, :border_radius),
      text: ["font-semibold", T.value(theme, :contrast_text)],
      text_size: "text-base",
      background: [T.value(theme, :background), T.value(theme, :background_hover)],
      ring: ["focus:outline-none focus:ring-4", T.value(theme, :ring)],
      icon: T.value(theme, :icon),
      shadow: "shadow-lg"
    ]
  end

  # Icons - put these in a separate icon component with all the hero icons
  defp icon(:cross) do
    ~E"""
    <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
    </svg>
    """
  end
  defp icon(:error) do
    ~E"""
    <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4m0 4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
    </svg>
    """
  end
  defp icon(:warning) do
    ~E"""
    <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z" />
    </svg>
    """
  end
  defp icon(_default) do
    ~E"""
    <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
    </svg>
    """
  end
end
