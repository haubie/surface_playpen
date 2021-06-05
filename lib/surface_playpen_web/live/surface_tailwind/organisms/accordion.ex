defmodule SurfaceTailwind.Accordion do
  @moduledoc """
  A basic **breadcrumb**.
  """
  use Surface.LiveComponent
  alias SurfaceTailwind.Theme, as: T

  @doc "Css classes to propagate to the breadcrumbs's top level element <div>."
  prop theme, :atom, default: :primary
  prop class, :css_class
  prop background, :css_class
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
  data animation, :string, default: ""

  @doc """
  item
  """
  slot item, required: true


  def render(assigns) do
    ~H"""
    <div class={{"border-b border-200", @margin}}>
      <div class={{"flex flex-row justify-end items-center", classes(assigns, :header)}}>
        <h3 class="flex-1 text-2xl">Frequently asked questions</h3>
        <a class="text-sm inline-flex row hover:underline" :on-click="expand_all" :if={{not @all_expanded}}>{{icon(:plus)}} Expand all</a>
        <a class="text-sm inline-flex row hover:underline" :on-click="collapse_all" :if={{@all_expanded}}>{{icon(:minus)}} Collapse all</a>
      </div>

      <div :for.with_index={{ {accordion_item,i} <- @item }} class="border-t border-200 pb-5 hover:bg-gray-50">
        <a class="flex flex-row pt-7 pb-2 hover:underline" :on-click="item_click" phx-value-index={{ i }}>
          <div class="flex-1 font-semibold text-lg text-gray-800 pr-2">{{accordion_item[:title]}}</div>
          <div class="w-12 flex flex-row justify-end text-gray-400">
            <span :if={{@all_expanded or @active_item == i}} :on-click="item_click" phx-value-index={{ i }}>{{icon(:up)}}</span>
            <span :if={{not (@all_expanded or @active_item == i)}} :on-click="item_click" phx-value-index={{ i }}>{{icon(:down)}}</span>
          </div>
        </a>
        <div>
        </div>
        <div class={{"text-gray-500 pr-16", @animation }} :show={{@all_expanded or (@active_item == i)}}>
          <slot name="item" index={{i}} />
        </div>
      </div>

    </div>

    """
  end

  def handle_event("item_click", %{"index" => index_str}, socket) do
    index = String.to_integer(index_str)
    animation = next_animation(socket.assigns, index)
    index = if socket.assigns.active_item == index, do: nil, else: index

    {:noreply, assign(socket, active_item: index, animation: "")}
  end

  def handle_event("expand_all", _, socket) do
    # animation = next_animation(socket.assigns, index)
    {:noreply, assign(socket, all_expanded: true)}
  end

  def handle_event("collapse_all", _, socket) do
    # animation = next_animation(socket.assigns, index)
    {:noreply, assign(socket, all_expanded: false, active_item: nil)}
  end

  defp next_animation(assigns, clicked_index) do
    %{animation: animation, active_item: active_item} = assigns

    cond do
      clicked_index == active_item ->
        "scale-y-100"

      clicked_index != active_item ->
        "scale-y-0"

      true ->
        animation
    end
  end

  def classes(assigns, :header), do: T.build_class_list(assigns, &header_theme/1)

  # def classes(assigns, :top), do: T.build_class_list(assigns, &component_theme/1)
  # def classes(assigns, :link), do: T.build_class_list(assigns, &link_theme/1)
  # def classes(assigns, :bordered, true), do: T.build_class_list(assigns, &border_theme/1)
  # def classes(_assigns, :bordered, false), do: nil

  def header_theme(theme) do
  [
    padding: "pb-2",
    text_color: T.value(theme, :text),
    border: ["border-b-4", T.value(theme, :border_accent)]
  ]
  end


  # def component_theme(_theme) do
  #   [
  #     alignment: "inline-flex flex-row items-center",
  #     text_size: "text-sm"
  #   ]
  # end

  # def border_theme(theme) do
  #   [
  #     background: "white",
  #     shadow: "shadow",
  #     padding: ["pl-7", "pr-8"],
  #     border: T.value(theme, :border_light),
  #     border_radius: T.value(:general, :border_radius),
  #   ]
  # end

  # def link_theme(theme) do
  #   [
  #     text: [
  #       T.value(theme, :light_text),
  #       T.value(theme, :light_text_hover)]
  #   ]
  # end

  defp icon(:up) do
    ~E"""
    <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 15l7-7 7 7" />
    </svg>
    """
  end

  defp icon(:down) do
    ~E"""
    <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7" />
    </svg>
    """
  end

  defp icon(:plus) do
    ~E"""
    <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" viewBox="0 0 20 20" fill="currentColor">
      <path fill-rule="evenodd" d="M10 5a1 1 0 011 1v3h3a1 1 0 110 2h-3v3a1 1 0 11-2 0v-3H6a1 1 0 110-2h3V6a1 1 0 011-1z" clip-rule="evenodd" />
    </svg>
    """
  end

  defp icon(:minus) do
    ~E"""
    <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" viewBox="0 0 20 20" fill="currentColor">
      <path fill-rule="evenodd" d="M5 10a1 1 0 011-1h8a1 1 0 110 2H6a1 1 0 01-1-1z" clip-rule="evenodd" />
    </svg>
    """
  end

end

defmodule SurfaceTailwind.AccordionItem do
  use Surface.Component, slot: "item"

  prop expanded, :boolean, default: false
  prop title, :string
end
