# defmodule SurfaceTailwind.Menu.MenuGroup do
#   @moduledoc """
#   Defines a menu group for the parent menu component.

#   The tab item instance is automatically added to the
#   parent's `menu` slot.
#   """
#   use Surface.Component, slot: "menu_groups"


#   @doc "Item title"
#   prop title, :string, default: ""

#   @doc "Item icon"
#   prop icon, :string

#   @doc "Item label"
#   prop label, :string

#   @doc "Item is disabled"
#   prop disabled, :boolean, default: false

#   @doc "Item is visible"
#   prop visible, :boolean, default: true

#   slot menus, required: false

#   def render(assigns) do
#   ~F"""
#     <h2 class="text-2xl text-pink-600">Group: {@title}</h2>
#     <#slot name="menus" />
#   """
#   end

# end
