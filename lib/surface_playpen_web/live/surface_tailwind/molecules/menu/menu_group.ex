defmodule SurfaceTailwind.Menu.MenuGroup do
  @moduledoc """
  Defines a menu group for the parent menu component.

  The tab item instance is automatically added to the
  parent's `menu` slot.
  """
  use Surface.Component, slot: "menus"


  @doc "Item title"
  prop title, :string, default: ""

  @doc "Item icon"
  prop icon, :string

  @doc "Item label"
  prop label, :string

  @doc "Item is disabled"
  prop disabled, :boolean, default: false

  @doc "Item is visible"
  prop visible, :boolean, default: true

  prop exapandable, :boolean, default: false

  slot menus, required: true

  def render(assigns) do
  ~F"""
  <li class="mt-3">
    <h3 class="text-sm text-indigo-600 uppercase mb-1.5 tracking-wider">{@title}</h3>
    <ul class="flex flex-col">
        <#slot name="menus" index={index} :for.with_index={{_menu,index} <- @menus}/>
    </ul>
  </li>
  """
  end

end
