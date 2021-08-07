defmodule SurfaceTailwind.Tabs do
  @moduledoc """
  A simple horizontal navigation **tabs** component
  """

  use Surface.LiveComponent
  alias SurfaceTailwind.Tabs.TabItem
  alias SurfaceTailwind.{Button,Icon}
  alias SurfaceTailwind.Theme, as: T

  @doc "Make tab full width"
  prop expanded, :boolean, default: false

  @doc "Classic style with borders"
  prop boxed, :boolean, default: false

  prop theme, :atom, default: :primary

  prop location, :string, default: "top", values: ["top", "left"]

  prop label_width, :css_class, default: "w-28 sm:w-32 md:w-44"

  @doc "The tabs to display"
  slot tabs, required: true

  data active_tab, :integer, default: 0

  data animation, :string, default: ""


  def update(assigns, socket) do
    first_visible_tab = Enum.find_index(assigns.tabs, & &1.visible)

    socket =
      socket
      |> assign(assigns)
      |> assign(:active_tab, first_visible_tab)

    {:ok, socket}
  end


  def render(assigns) do
    ~H"""
    <div class={{"flex", "flex-col": (@location == "top"), "flex-row": (@location == "left")}}>
      <nav>
        <ul class={{
                    "flex border-gray-200",
                    "flex-row flex-nowrap	border-b overflow-y-scroll": (@location == "top"),
                    "flex-col border-r": (@location == "left")
                  }}>
          <li
            :for.with_index={{ {tab,index} <- @tabs }}
            class={{
                "group transition duration-300 ease-in-out text-sm font-medium block flex flex-row border-transparent",
                "border-b-2 px-4 h-12 flex-grow": (@location == "top"),
                "border-r-2 py-3 pr-4 #{@label_width}": (@location == "left"),
                "border-indigo-500 text-indigo-800": @active_tab == index,
                "hover:border-indigo-200 hover:text-indigo-800": !tab.disabled,
                "cursor-not-allowed": tab.disabled
              }}>
            <a :on-click="tab_click" phx-value-index={{index}}
                class={{
                        "block flex flex-row transition duration-300 ease-in-out transform justify-center",
                        "min-w-max": @location == "top",
                        "group-hover:-translate-y-1 items-center": (@location == "top" and !tab.disabled),
                        "group-hover:translate-x-1 items-left": (@location == "left" and !tab.disabled),
                        "cursor-pointer": !tab.disabled,
                        "pointer-events-none justify-center items-center": tab.disabled
                      }}>
              <Icon :if={{tab.icon}} icon={{tab.icon}} class="mr-2" aria-hidden="true" w="w-6" h="h-6"/>
              <span class="inline-block">{{tab.label}}</span>
            </a>
          </li>
        </ul>
      </nav>
      <section class="overflow-hidden">
        <div
          :for.with_index={{ {tab,index} <- @tabs }}
          :show={{tab.visible && @active_tab == index}}
          class={{"pt-3": (@location == "top"), "pl-3": (@location == "left")}}>
        <slot name="tabs" index={{index}} />
        </div>
      </section>
    </div>
    """
  end

  def handle_event("tab_click", %{"index" => index_str}, socket) do
    index = String.to_integer(index_str)

    {:noreply, assign(socket, active_tab: index)}
  end


end
