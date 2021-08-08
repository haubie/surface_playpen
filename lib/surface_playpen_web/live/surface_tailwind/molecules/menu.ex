defmodule SurfaceTailwind.Menu do
  @moduledoc """
  Vertical navigation component. Accepts `MenuItems` in the main slot.
  """
  use Surface.Component
  alias SurfaceTailwind.Icon
  alias SurfaceTailwind.Theme, as: T

  @doc "CSS classes to propagate to the menu's top level element <div>."
  prop class, :css_class


  # prop type, :string, default: "default", values: ["default", "success", "warning", "alert"]

  @doc """
  Used to set which styles are used from the global theme definition. The default is :primary.
  Depending on your global theme setup, you may also have the additional styles:
    :secondary, :secondary_varient, :neutral, :tertiary
    :info, :warning, :error, :success

  If :alert is used, the styles from the :error theme are used.
  """
  prop theme, :string, default: :primary, values: [:primary, :success, :warning, :alert, :error]

  prop title, :string

  @doc """
  The content to be organised by the grid rules.
  """
  #  slot menus

  slot menus, required: true

  # slot menu_groups, required: false



  def render(assigns) do
    ~F"""
    <h2 :if={@title} class="text-md font-semibold text-indigo-900">{@title}</h2>
    <ul class="flex flex-col max-w-sm mt-3">
      <#slot name="menus" index={index} :for.with_index={{menu,index} <- @menus}/>
    </ul>
    """
  end


  # <ul class="flex flex-col max-w-sm">

  #     <li class="group flex flex-row px-2 py-1 text-baseline rounded items-center hover:bg-gray-200" :for.with_index={{ {menu,index} <- @menus }}>
  #       <span :if={{menu.icon}} class="w-7 mr-3 flex flex-row items-center text-gray-400 group-hover:text-gray-600">
  #         <Icon icon={{menu.icon}} h="h-7" w="w-7" />
  #       </span>
  #       <span class="flex-1 py-2 text-gray-700">
  #         {{menu.title}}
  #       </span>
  #       <span :if={{menu.label}} class="inline-block rounded-full w-8 border border-white bg-gray-200 group-hover:bg-gray-50 px-1
  #                    text-xs flex items-center justify-center h-6 text-center">
  #                    {{menu.label}}
  #       </span>
  #     </li>

  #   </ul>

end
