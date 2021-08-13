defmodule SurfaceTailwind.Menu.MenuItem do
  @moduledoc """
  Defines a menu item for the parent menu component.

  The tab item instance is automatically added to the
  parent's `menu` slot.
  """

  use Surface.Component, slot: "menus"
  alias SurfaceTailwind.Icon

  alias Surface.Components.LivePatch
  alias Surface.Components.Link
  alias Surface.Components.LiveRedirect


  @doc "Item title"
  prop title, :string, default: ""

  @doc """
  Additional attributes to add onto the generated link element
  """
  prop opts, :keyword, default: []

  @doc "The method to use with the link"
  prop method, :atom, default: :get

  @doc "Class or classes to apply to the link"
  prop class, :css_class

  @doc "Item icon"
  prop icon, :string

  @doc "Item label"
  prop label, :string

  @doc "Item is disabled"
  prop disabled, :boolean, default: false

  @doc "Item is visible"
  prop visible, :boolean, default: true

  @doc "Item href"
  prop href, :string

  @doc "Item redirect"
  prop redirect, :string

  @doc "Item patch"
  prop patch, :string

  slot default

  def render(assigns) do
    ~F"""
      <li class="">

        {#if @href}
          <Link to={@href} opts={@opts} method={@method} class={["group flex flex-col sm:flex-row px-2 py-1 text-sm font-medium rounded items-center hover:bg-gray-200", @class]}>
            {render_link_contents(assigns)}
          </Link>

        {#elseif @patch}
          <LivePatch to={@patch} opts={@opts} class={["group flex flex-col sm:flex-row px-2 py-1 text-sm font-medium rounded items-center hover:bg-gray-200", @class]}>
            {render_link_contents(assigns)}
          </LivePatch>

        {#elseif @redirect}
          <LiveRedirect to={@redirect} opts={@opts} class={["group flex flex-col sm:flex-row px-2 py-1 text-sm font-medium rounded items-center hover:bg-gray-200", @class]}>
            {render_link_contents(assigns)}
          </LiveRedirect>

        {#else}
          <Link to="" opts={@opts} method={@method} class={["group flex flex-col sm:flex-row px-2 py-1 text-sm font-medium rounded items-center hover:bg-gray-200", @class]}>
            {render_link_contents(assigns)}
          </Link>

        {/if}

      </li>
    """
  end

  def render_link_contents(assigns) do
    ~F"""
    <span :if={@icon} class="w-7 mr-0 sm:mr-3 flex flex-row items-center text-gray-400 group-hover:text-gray-600">
          <Icon icon={@icon} h="h-7" w="w-7" />
    </span>
    <span class="flex-1 py-2 text-gray-700">
      {@title}<#slot/>
    </span>
    <span :if={@label} class="inline-block rounded-full w-8 border border-white bg-gray-200 group-hover:bg-gray-50 px-1
                  text-xs flex items-center justify-center h-6 text-center">
      {@label}
    </span>
    """
  end


end
