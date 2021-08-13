defmodule SurfaceTailwind.Icon do
  @moduledoc """
  A selection of SVG **icons**.

  All icons have been designed to fit in square shape. Make the width and height the same, e.g.:

    `<Icon icon="tick" w="w-5" h="h-5"/>`

    `<Icon icon="tick" w="w-12" h="h-12"/>`

  The default width and height is `w-6` `h-6`

  These are from the MIT-lisenced https://heroicons.com/ collection.
  The icons are from the makers of Tailwind CSS, designed by @steveschoger https://twitter.com/steveschoger
  """
  use Surface.Component
  alias SurfaceTailwind.Theme, as: T

  @doc "Additional CSS classes to append to the button element."
  prop class, :css_class

  @doc "String label for the icon"
  prop icon, :string

  @doc "Width class. Default is `w-6`."
  prop w, :css_class, default: "w-6"

  @doc "Height class. Default is `h-6`."
  prop h, :css_class, default: "h-6"

  @doc "Used for the text color class for SVGs. E.g. `text-green-600`. This will override any text color class from the theme."
  prop colour, :css_class

  @doc "For display rules. Defaults for `inline-block`."
  prop display, :css_class, default: "inline-block"

  @doc """
  Used to set which styles are used from the global theme definition. The default is `:primary`.
  Depending on your global theme setup, you may also have the additional styles:
    `:secondary`, `:secondary_varient`, `:neutral`, `:tertiary`
    `:info`, `:warning`, `:error`, `:success`

  The `:disabled` global theme is applied if the button has the property `disabled=true`.
  """
  prop theme, :atom

  def render(assigns) do
    ~F"""
    <div class={@display, @w, @h, colour_class(@theme, @colour), @class}>
      {icon(@icon)}
    </div>
    """
  end

  defp colour_class(nil, nil), do: ""
  defp colour_class(theme, nil), do: T.value(theme, :text)
  defp colour_class(theme, colour_prop), do: colour_prop

  defp icon("cross") do
    ~E"""
    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
    </svg>
    """
  end

  defp icon("tick") do
    ~E"""
    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z" />
    </svg>
    """
  end

  defp icon("home") do
    ~E"""
    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor">
      <path d="M10.707 2.293a1 1 0 00-1.414 0l-7 7a1 1 0 001.414 1.414L4 10.414V17a1 1 0 001 1h2a1 1 0 001-1v-2a1 1 0 011-1h2a1 1 0 011 1v2a1 1 0 001 1h2a1 1 0 001-1v-6.586l.293.293a1 1 0 001.414-1.414l-7-7z" />
    </svg>
    """
  end


  defp icon("up") do
    ~E"""
    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 15l7-7 7 7" />
    </svg>
    """
  end

  defp icon("down") do
    ~E"""
    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7" />
    </svg>
    """
  end

  defp icon("plus") do
    ~E"""
    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor">
      <path fill-rule="evenodd" d="M10 5a1 1 0 011 1v3h3a1 1 0 110 2h-3v3a1 1 0 11-2 0v-3H6a1 1 0 110-2h3V6a1 1 0 011-1z" clip-rule="evenodd" />
    </svg>
    """
  end

  defp icon("minus") do
    ~E"""
    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor">
      <path fill-rule="evenodd" d="M5 10a1 1 0 011-1h8a1 1 0 110 2H6a1 1 0 01-1-1z" clip-rule="evenodd" />
    </svg>
    """
  end

  defp icon("new_page") do
    ~E"""
    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor">
      <path fill-rule="evenodd" d="M6 2a2 2 0 00-2 2v12a2 2 0 002 2h8a2 2 0 002-2V7.414A2 2 0 0015.414 6L12 2.586A2 2 0 0010.586 2H6zm5 6a1 1 0 10-2 0v2H7a1 1 0 100 2h2v2a1 1 0 102 0v-2h2a1 1 0 100-2h-2V8z" clip-rule="evenodd" />
    </svg>
    """
  end

end
