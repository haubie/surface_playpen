defmodule SurfaceTailwind.Theme do

  # A nested keyword list which defines the global theme styles.
  # Component authors can incorporate these values into their component
  # though the SurfaceTailwind.Theme.value/2 function.
  # This is usually used in a SurfaceTailwind component in the following function:
  #
  # alias SurfaceTailwind.Theme, as: T
  # def component_theme(theme \\ :primary) when is_atom(theme) do
  #   [
  #     alignment: "inline-flex items-center justify-center",
  #     padding: "px-4 py-2",
  #     margin: "",
  #     border: "border rounded-md #{T.value(theme, :main, :border)}",
  #     text: "font-medium #{T.value(theme, :main, :contrast_text)} hover:#{T.value(theme, :dark, :contrast_text)}",
  #     text_size: "text-base",
  #     background: "#{T.value(theme, :main, :background)} hover:#{T.value(theme, :dark, :background)}",
  #     ring: "focus:outline-none focus:ring-4 focus:#{T.value(theme, :main, :ring)}"
  #   ]
  # end
  #
  # This function describes the theme for the component, and how global theme stules should be merged in.
  def get_theme() do
    [
        general: [
          style: [
            border_radius: "rounded-md"
          ]
        ],
        primary: [
          main: [
            background: "bg-blue-700",
            background_hover: "hover:bg-blue-900",
            text: "text-blue-700",
            contrast_text: "text-white",
            contrast_text_hover: "hover:text-white",
            border: "border-transparent",
            ring: "ring-pink-600 focus:outline-none focus:ring-4"
          ],
          dark: [
            background: "bg-blue-900",
            text: "text-blue-900",
            contrast_text: "text-white",
            contrast_text_hover: "hover:text-white",
            border: "border-blue-800",
            ring: "ring-pink-600 focus:outline-none focus:ring-4"
          ],
          light: [
            background: "bg-blue-50",
            text: "text-blue-400",
            contrast_text: "text-white",
            border: "border-blue-400",
            ring: "ring-pink-600 focus:outline-none focus:ring-4"
          ]
        ],
        secondary: [
          main: [
            background: "bg-blue-50",
            background_hover: "hover:bg-blue-500",
            text: "text-blue-700",
            contrast_text: "text-blue-700",
            contrast_text_hover: "hover:text-white",
            border: "border-blue-700",
            ring: "ring-pink-600 focus:outline-none focus:ring-4"
          ]
        ],
        disabled: [
          main: [
            background: "bg-gray-50",
            text: "text-gray-700",
            contrast_text: "text-gray-400",
            border: "border-gray-200",
            ring: "ring-pink-600 focus:outline-none focus:ring-4"
          ]
        ],
        neutral: [
          main: [
            background: "bg-gray-100",
            background_hover: "hover:bg-gray-500",
            text: "text-gray-700",
            contrast_text: "text-gray-700",
            contrast_text_hover: "hover:text-white",
            border: "border-gray-500",
            ring: "ring-pink-600 focus:outline-none focus:ring-4"
          ]
        ],
        error: [
          main: [
            background: "bg-red-700",
            text: "bg-red-700",
            contrast_text: "text-white",
            border: "",
            ring: "ring-blue-500",
          ]
        ],
        info: [
          main: [
            background: "bg-blue-700",
            text: "bg-blue-700",
            contrast_text: "text-white",
            border: "",
            ring: "ring-pink-500",
          ]
        ],
        warning: [
          main: [
            background: "bg-yellow-600",
            text: "bg-yellow-700",
            contrast_text: "text-white",
            border: "border-transparent",
            ring: "ring-pink-500",
          ]
        ],
        success: [
          main: [
            background: "bg-green-600",
            text: "bg-green-700",
            contrast_text: "text-white",
            border: "border-transparent",
            ring: "ring-pink-500",
          ]
        ]
    ]
  end

  # Gets the value from the global theme configuration.
  # theme_key is used to represent a group, of values, like the :primary or : secondary colour pallet.
  # type represents the sub-grouping, such as :main, :dark or :light. By convention, there is at least a :main
  # element represents the specific element you're requesting the value for. For example, :background for the background styles,
  # :contrast_text for the style that will work with the best contrast if used on the background, etc.
  def value(theme_key, type, element), do: get_in(get_theme(), [theme_key, type, element])

  # Used within a component to build the classes to be attached to the component.
  # assigns is the assigns of the component and is used to access a component's props.
  # component_theme_fn takes a function which holds the theme definition for the component. It must return a key-value list.
  def build_class_list(assigns, component_theme_fn) do
    selected_theme = if Map.has_key?(assigns, :disabled) and (assigns.disabled == true), do: :disabled, else: assigns.theme

    themable_props = component_theme_fn.(nil) |> Keyword.keys()
    {overridden_class_list, theme_class_list} =
      themable_props
      |> Enum.split_with(fn class_group -> if Map.get(assigns, class_group) != nil, do: true, else: false end)

    classes_from_component_theme =
      theme_class_list
      |> Enum.map(fn class_group -> component_theme_value(class_group, selected_theme, component_theme_fn) end)

    classes_from_component_user =
      overridden_class_list
      |> Enum.map(fn class_group -> Map.get(assigns, class_group) end)

    classes_from_component_theme ++ classes_from_component_user ++ [assigns.class] |> List.flatten()
  end

  # Extracts the value of a property from the component's theme definition function
  defp component_theme_value(property, theme, component_theme_fn) do
      theme_data = component_theme_fn.(theme)
      get_in(theme_data, [property])
  end

end
