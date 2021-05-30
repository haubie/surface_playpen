defmodule SurfaceTailwind.Theme do

  # @palette [
  #   # secondary: [
  #   #   main: "blue-700",
  #   #   light: "blue-400",
  #   #   dark: "blue-900"
  #   # ],
  #   # neutral: [
  #   #   main: "gray-500"
  #   # ],
  #   # error: [
  #   #   main: "pink-900"
  #   # ],
  #   # warning:  [
  #   #   main: "blue-700"
  #   # ],
  #   # info:  [
  #   #   main: "blue-700"
  #   # ],
  #   # success:  [
  #   #   main: "blue-700"
  #   # ]
  # ]

  def get_palette do
    [
        primary: [
          main: [
            background: "bg-blue-700",
            text: "text-blue-700",
            contrast_text: "text-white",
            border: "border-transparent",
            ring: "ring-pink-600"
          ],
          dark: [
            background: "bg-blue-900",
            text: "text-blue-900",
            contrast_text: "text-white",
            border: "border-blue-800",
            ring: "ring-pink-600"
          ],
          light: [
            background: "bg-blue-50",
            text: "text-blue-400",
            contrast_text: "text-white",
            border: "border-blue-400",
            ring: "ring-pink-600"
          ]
        ],
        secondary: [
          main: [
            background: "bg-blue-50 seco",
            text: "text-blue-700",
            contrast_text: "text-blue-700",
            border: "border-blue-700",
            ring: "ring-pink-600"
          ],
          dark: [
            background: "bg-blue-500",
            text: "text-blue-800",
            contrast_text: "text-white",
            border: "border-blue-800",
            ring: "ring-pink-600"
          ],
          light: [
            background: "bg-blue-100",
            text: "text-blue-400",
            contrast_text: "text-blue-700",
            border: "border-blue-100",
            ring: "ring-pink-600"
          ]
        ],
        disabled: [
          main: [
            background: "bg-gray-50",
            text: "text-gray-700",
            contrast_text: "text-gray-400",
            border: "border-gray-200",
            ring: "ring-pink-600"
          ]
        ],
        neutral: [
          main: [
            background: "bg-gray-100",
            text: "text-gray-700",
            contrast_text: "text-gray-700",
            border: "border-gray-500",
            ring: "ring-pink-600"
          ],
          dark: [
            background: "bg-gray-500",
            text: "text-gray-800",
            contrast_text: "text-white",
            border: "border-gray-800",
            ring: "ring-pink-600"
          ],
          light: [
            background: "bg-gray-100",
            text: "text-gray-400",
            contrast_text: "text-gray-700",
            border: "border-gray-100",
            ring: "ring-pink-600"
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
        warn: [
          main: [
            background: "bg-yellow-600",
            text: "bg-yellow-700",
            contrast_text: "text-white",
            border: "border-transparent",
            ring: "ring-pink-500",
          ]
        ]

    ]
  end


  def get_theme(pallet \\ :primary) when is_atom(pallet) do
    IO.puts "GLOBAL GET_THEME"
    [
      button: [
        alignment: "inline-flex items-center justify-center",
        padding: "px-4 py-2",
        margin: "",
        border: "border rounded-md #{color(pallet, :main, :border)}",
        text: "font-medium #{color(pallet, :main, :contrast_text)} hover:#{color(pallet, :dark, :contrast_text)}",
        text_size: "text-base",
        background: "#{color(pallet, :main, :background)} hover:#{color(pallet, :dark, :background)}",
        ring: "focus:outline-none focus:ring-4 focus:#{color(pallet, :main, :ring)}"
      ],
      # alert: [
      #   size: "w-full",
      #   alignment: "inline-flex items-center justify-left",
      #   padding: "px-4 py-5",
      #   margin: "",
      #   border: "border #{color(pallet, :main, :border)}",
      #   text: "font-semibold #{color(pallet, :main, :contrast_text)}",
      #   text_size: "text-base",
      #   background: "#{color(pallet, :main, :background)} hover:#{color(pallet, :dark, :background)}",
      #   ring: "focus:outline-none focus:ring-4 focus:#{color(pallet, :main, :ring)}",
      #   icon: value(pallet, :main, :icon)
      # ]
    ]
  end

  def get_theme(pallet) when is_binary(pallet), do: get_theme(String.to_atom(pallet))

  def color(palette_name, type, element), do: get_in(get_palette(), [palette_name, type, element])
  def value(palette_name, type, element), do: get_in(get_palette(), [palette_name, type, element])

  def component(component, property), do: get_in(get_theme(), [component, property])
  def component(component, property, theme), do: get_in(get_theme(theme), [component, property])

  def classes(assigns, component_name, themable_props) do

    theme = if (assigns.disabled != true), do: assigns.theme, else: :disabled

    {overridden_class_list, theme_class_list} =
      themable_props
      |> Enum.split_with(fn class_group -> if Map.get(assigns, class_group) != nil, do: true, else: false end)

    classes_from_theme =
      theme_class_list
      |> Enum.map(fn class_group -> component(component_name, class_group, theme) end)

    classes_from_component_user =
      overridden_class_list
      |> Enum.map(fn class_group -> Map.get(assigns, class_group) end)

    classes_from_theme ++ classes_from_component_user
  end



  # updated to recieve a components theme keyword list as a function

  def build_class_list(assigns, theme_function) do

    themable_props = theme_function.(nil) |> Keyword.keys()

    selected_theme = if Map.has_key?(assigns, :disabled) and (assigns.disabled == true), do: :disabled, else: assigns.theme

    {overridden_class_list, theme_class_list} =
      themable_props
      |> Enum.split_with(fn class_group -> if Map.get(assigns, class_group) != nil, do: true, else: false end)

    # classes_from_theme =
    #   theme_class_list
    #   |> Enum.map(fn class_group -> theme_value(class_group, selected_theme) end)

    classes_from_theme =
      theme_class_list
      |> Enum.map(fn class_group -> theme_value_with_fun(class_group, selected_theme, theme_function) end)

    classes_from_component_user =
      overridden_class_list
      |> Enum.map(fn class_group -> Map.get(assigns, class_group) end)

    classes_from_theme ++ classes_from_component_user ++ assigns.class
  end

  defp theme_value_with_fun(property, theme, theme_func) do
      theme_data = theme_func.(theme)
      get_in(theme_data, [property])
  end



end
