defmodule SurfaceTailwind.Accordion do
  @moduledoc """
  An **accordion**.
  """
  use Surface.LiveComponent
  alias SurfaceTailwind.Theme, as: T
  alias SurfaceTailwind.Icon

  @doc "Css classes to propagate to the breadcrumbs's top level element <div>."
  prop theme, :atom, default: :primary
  prop class, :css_class
  prop separator_color, :css_class, default: "text-gray-200"
  prop full_width, :boolean, default: false
  prop padding, :css_class
  prop margin, :css_class
  prop border, :css_class
  prop bordered, :boolean, default: false
  prop border_radius, :css_class
  prop shadow, :css_class
  prop text, :css_class
  prop alignment, :css_class, default: "inline-flex flex-row items-center"

  data active_item, :integer, default: nil
  data all_expanded, :boolean, default: false

  @doc """
  item
  """
  slot item, required: true


  def render(assigns) do
    ~H"""
    <div class={{"border-b border-200", @margin}}>
      <div class={{"flex flex-row justify-end items-center", classes(assigns, :header)}}>
        <h3 class="flex-1 text-2xl">Frequently asked questions</h3>
        <a class="text-sm inline-flex row hover:underline" :on-click="expand_all" :if={{not @all_expanded}}><Icon icon="plus" w="w-5" h="h-5"/> Expand all</a>
        <a class="text-sm inline-flex row hover:underline" :on-click="collapse_all" :if={{@all_expanded}}><Icon icon="minus" w="w-5" h="h-5"/> Collapse all</a>
      </div>

      <div :for.with_index={{ {accordion_item,i} <- @item }} class="border-t border-200 pb-5">
        <a class="flex flex-row pt-7 pb-2 group hover:underline" :on-click="item_click" phx-value-index={{ i }}>
          <div class={{"flex-1 font-semibold text-lg text-gray-800 pr-2", classes(assigns, :question)}}>{{accordion_item[:title]}}</div>
          <div class="w-12 flex flex-row justify-end opacity-40 group-hover:opacity-100">
            <span :if={{@all_expanded or @active_item == i}} :on-click="item_click" phx-value-index={{ i }}><Icon icon="up" w="w-5" h="h-5" class="transition duration-300 ease-in-out transform group-hover:-translate-y-2"/></span>
            <span :if={{not (@all_expanded or @active_item == i)}} :on-click="item_click" phx-value-index={{ i }}><Icon icon="down" w="w-5" h="h-5" class="transition duration-300 ease-in-out transform group-hover:translate-y-2"/></span>
          </div>
        </a>
        <div>
        </div>
        <div class={{"text-gray-500 pr-16"}} :show={{@all_expanded or (@active_item == i)}}>
          <slot name="item" index={{i}} />
        </div>
      </div>

    </div>

    """
  end

  def handle_event("item_click", %{"index" => index_str}, socket) do
    index = String.to_integer(index_str)
    index = if socket.assigns.active_item == index, do: nil, else: index

    {:noreply, assign(socket, active_item: index)}
  end

  def handle_event("expand_all", _, socket) do
    {:noreply, assign(socket, all_expanded: true)}
  end

  def handle_event("collapse_all", _, socket) do
    {:noreply, assign(socket, all_expanded: false, active_item: nil)}
  end



  defp classes(assigns, :header), do: T.build_class_list(assigns, &header_theme/1)
  defp classes(assigns, :question), do: T.build_class_list(assigns, &question_theme/1)


  defp header_theme(theme) do
    [
      padding: "pb-2",
      text: T.value(theme, :text),
      border: ["border-b-4", T.value(theme, :border_accent)]
    ]
  end

  defp question_theme(theme) do
    [
      text: T.value(theme, :text_dark)
    ]
  end

end

defmodule SurfaceTailwind.AccordionItem do
  use Surface.Component, slot: "item"

  prop expanded, :boolean, default: false
  prop title, :string
end
