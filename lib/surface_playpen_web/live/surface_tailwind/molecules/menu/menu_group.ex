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

  slot menus, required: false

  def render(assigns) do
  ~F"""
    <div class="border border-gray-900">
      <h2 class="text-sm text-indigo-600 uppercase">{@title}</h2>
      <div :for.with_index={{menu,index} <- @menus}>
      {index}
        <#slot name="menus" index={index} />
      </div>
    </div>
  """
  end

end
