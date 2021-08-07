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

  @doc "Choose if you want an underline or button style tab."
  prop style, :string, default: "underline", values: ["underline", "button"]

  prop location, :string, default: "top", values: ["top", "left"]

  prop label_width, :css_class, default: "w-28 sm:w-32 md:w-44"

  prop flex, :css_class, default: "flex-shrink", values: ["flex-shrink", "flex-grow"]

  prop theme, :atom, default: :primary

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

      <nav :if={{@style == "button"}}>{{render_button_list(assigns)}}</nav>
      <nav :if={{@style == "underline"}}>{{render_underline_list(assigns)}}</nav>

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


  def render_button_list(assigns) do
    ~H"""
    <ul class={{
              "flex",
              T.value(:neutral, :text),
              "flex-row flex-nowrap overflow-y-scroll space-x-6": (@location == "top"),
              "flex-col space-y-6": (@location == "left")
              }}>
      <li :for.with_index={{ {tab,index} <- @tabs }} class={{"flex flex-row", @flex, "#{@label_width}": (@location == "left")}}>

      <Button click="tab_click" value={{index}} theme={{button_class(@theme, index == @active_tab)}} class="ring-inset" alignment={{"flex justify-left", "flex-col sm:flex-row items-left w-full": (@location == "left"), "flex-row items-center justify-left min-w-max": (@location == "top")}}>
        <Icon :if={{tab.icon}} icon={{tab.icon}} class="mr-2 flex-shrink-0" aria-hidden="true" w="w-6" h="h-6"/>
        <span class="inline-block text-left align-text-bottom">{{tab.label}}</span>
      </Button>
      </li>
    </ul>
    """
  end


  def render_underline_list(assigns) do
    ~H"""
    <ul class={{
          "flex border-gray-200",
          T.value(:neutral, :text),
          "flex-row flex-nowrap	items-end border-b overflow-y-scroll h-14": (@location == "top"),
          "flex-col border-r": (@location == "left"),
        }}>
    <li
    :for.with_index={{ {tab,index} <- @tabs }}
    class={{
      "group transition duration-300 ease-in-out text-sm font-medium block flex flex-row border-transparent",
      "border-b-2 h-12 #{@flex}": (@location == "top"),
      "border-r-2 #{@label_width} flex-grow": (@location == "left"),
      "#{T.value(@theme, :border_accent)} #{T.value(@theme, :text)}": @active_tab == index,
      "hover:border-indigo-200 hover:text-indigo-800": !tab.disabled,
      "#{T.value(:disabled, :text_light)} cursor-not-allowed": tab.disabled
    }}>
    <a href="#" :on-click="tab_click" phx-value-index={{index}}
      class={{
              T.value(@theme, :ring),
              "px-4 ring-inset block flex w-full transition duration-300 ease-in-out transform",
              "min-w-max flex-row": @location == "top",
              "py-3 flex-col sm:flex-row": @location == "left",
              "group-hover:-translate-y-1 items-center": (@location == "top" and !tab.disabled),
              "group-hover:translate-x-1 items-left": (@location == "left" and !tab.disabled),
              "cursor-pointer": !tab.disabled,
              "pointer-events-none": tab.disabled
            }}>
      <Icon :if={{tab.icon}} icon={{tab.icon}} class="mr-2" aria-hidden="true" w="w-6" h="h-6"/>
      <span class="inline-block text-left">{{tab.label}}</span>
    </a>
    </li>
    </ul>
    """
  end


  def handle_event("tab_click", %{"value" => index_str}, socket), do: handle_event("tab_click", %{"index" => index_str}, socket)

  def handle_event("tab_click", %{"index" => index_str}, socket) do
    index = String.to_integer(index_str)

    {:noreply, assign(socket, active_tab: index)}
  end

  # Helpers for styling the active button tab
  defp button_class(theme, true), do: theme
  defp button_class(theme, false), do: :neutral


end
