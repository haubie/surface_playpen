defmodule SurfaceTailwind.Breadcrumb do
  @moduledoc """
  A basic **breadcrumb**.
  """
  use Surface.Component
  alias SurfaceTailwind.Theme, as: T

  @doc "Css classes to propagate to the breadcrumbs's top level element <div>."
  prop theme, :atom, default: :neutral
  prop class, :css_class
  prop background, :css_class
  prop separator, :string, default: "cheveron", values: ["cheveron", "slash", "divider"]
  prop separator_color, :css_class, default: "text-gray-200"
  prop full_width, :boolean, default: false
  prop padding, :css_class
  prop border, :css_class
  prop bordered, :boolean, default: false
  prop border_radius, :css_class
  prop shadow, :css_class
  prop text, :css_class
  prop alignment, :css_class, default: "inline-flex flex-row items-center"

  prop crumbs, :list, required: true

  @doc """
  The content to be organised by the grid rules.
  """
  slot default

  def render(assigns) do
    ~H"""
    <div>
      <ol class={{classes(assigns, :top), classes(assigns, :bordered, @bordered), "w-full": @full_width}} itemscope itemtype="https://schema.org/BreadcrumbList">
        <li itemprop="itemListElement" itemscope itemtype="https://schema.org/ListItem">
          <a href="/" class={{classes(assigns, :link)}} itemprop="item">{{icon(:home)}}<span class="sr-only" itemprop="name">Home</span></a>
          <meta itemprop="position" content="1" />
        </li>
        <li :for.with_index={{ {item, i} <- @crumbs }} class="flex justify-center items-center" itemprop="itemListElement" itemscope itemtype="https://schema.org/ListItem">
          <div class={{"h-11 flex justify-center items-center mx-3", @separator_color}}>{{divider(@separator)}}</div>
            <a :if={{ Map.has_key?(item, :href) }} href={{ item.href }} class={{classes(assigns, :link),"hover:underline","font-medium"}} itemprop="item"><span itemprop="name">{{ item.name }}</span></a>
            <span :if={{ not Map.has_key?(item, :href) }} itemprop="name" class={{classes(assigns, :link),"font-light"}}>{{ item.name }}</span>
            <meta itemprop="position" content={{i+2}} />
        </li>
      </ol>
    </div>
    """
  end

  def classes(assigns, :top), do: T.build_class_list(assigns, &component_theme/1)
  def classes(assigns, :link), do: T.build_class_list(assigns, &link_theme/1)
  def classes(assigns, :bordered, true), do: T.build_class_list(assigns, &border_theme/1)
  def classes(_assigns, :bordered, false), do: nil


  def component_theme(_theme) do
    [
      alignment: "inline-flex flex-row items-center",
      text_size: "text-sm"
    ]
  end

  def border_theme(theme) do
    [
      background: "white",
      shadow: "shadow",
      padding: ["pl-7", "pr-8"],
      border: T.value(theme, :main, :border_light),
      border_radius: T.value(:general, :style, :border_radius),
    ]
  end

  def link_theme(theme) do
    [
      text: [
        T.value(theme, :main, :light_text),
        T.value(theme, :main, :light_text_hover)]
    ]
  end

  defp icon(:home) do
    ~E"""
    <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" viewBox="0 0 20 20" fill="currentColor">
      <path d="M10.707 2.293a1 1 0 00-1.414 0l-7 7a1 1 0 001.414 1.414L4 10.414V17a1 1 0 001 1h2a1 1 0 001-1v-2a1 1 0 011-1h2a1 1 0 011 1v2a1 1 0 001 1h2a1 1 0 001-1v-6.586l.293.293a1 1 0 001.414-1.414l-7-7z" />
    </svg>
    """
  end

  defp divider("cheveron") do
    ~E"""
    <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7" />
    </svg>
    """
  end

  defp divider("slash") do
    ~E"""
    <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 transform -rotate-45" fill="none" viewBox="0 0 24 24" stroke="currentColor">
      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M20 12H4" />
    </svg>
    """
  end

  defp divider("divider") do
    ~E"""
    <svg class="h-11 w-11 p-0 m-0" stroke="currentColor" clip-rule="evenodd" fill-rule="evenodd" stroke-linejoin="round" stroke-miterlimit="1.5" viewBox="0 0 491 491" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
      <clipPath id="a">
        <path clip-rule="evenodd" d="m107.856 0h293.704v490.8h-293.704z"/>
      </clipPath>
      <g clip-path="url(#a)"><path d="m125.529 505.539 261.218-260.139-260.701-260.139" fill="none" stroke-width="16"/></g>
    </svg>
    """
  end




end
