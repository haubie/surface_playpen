defmodule SurfaceTailwind.Modal do
  @moduledoc """
  A flexible **modal** component.

  The modal has the following sections:
  * Title
  * Message
  * Body (slot)
  * Actions (buttons)

  An icon can be optionally shown next to the title.


  """
  use Surface.Component
  alias SurfaceTailwind.{Button, Backdrop}
  alias SurfaceTailwind.Theme, as: T

  @doc "CSS classes to propagate to the breadcrumbs's top level element <div>."
  prop class, :css_class
  prop action, :event
  prop secondary_action, :event
  prop show, :boolean, default: false

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
  prop message, :string
  prop icon, :string

  @doc """
  The content to be organised by the grid rules.
  """
  slot default

  def render(assigns) do
    ~H"""
    <div id="simple_modal" :if={{@show}}>
      <Backdrop>

          <div class={{"inline-block bg-white rounded-lg text-left overflow-hidden shadow-xl transform transition-all sm:my-8 align-middle w-full sm:max-w-lg", @class}} role="dialog" aria-modal="true" aria-labelledby="modal-headline">
            <div class="px-4 pt-5 pb-4 sm:p-6 sm:pb-4">

              <div class="sm:flex sm:items-start mr-0 sm:mr-3">

                <div :if={{@icon}} class={{"mx-auto flex-shrink-0 flex items-center justify-center h-12 w-12 rounded-full sm:mx-0 sm:h-10 sm:w-10", classes_icon(@theme)}}>
                  {{ @icon }}
                </div>

                <div class="mt-3 text-center sm:mt-0 sm:ml-4 sm:text-left w-full">

                  <h3 class="text-lg leading-6 font-medium text-gray-900" id="modal-headline">
                    {{@title}}
                  </h3>

                  <div class="mt-2 w-full text-sm text-gray-500">
                    <p>
                      {{@message}}
                    </p>
                    <div class="w-full">
                      <slot/>
                    </div>
                  </div>

                </div>
              </div>
            </div>

            <div class="bg-gray-50 px-4 py-3 sm:px-6 flex flex-row-reverse space-x-reverse space-x-3">
              <Button theme={{classes_primary_button(@theme)}} click={{@action}} >Accept</Button>
              <Button theme={{:neutral}} click={{@secondary_action}} >Cancel</Button>
            </div>

          </div>

        </Backdrop>
    </div>
    """
  end

  defp classes_primary_button(:alert), do: :error
  defp classes_primary_button(theme), do: theme


  defp classes_icon(:alert), do: classes_icon(:error)
  # defp classes_icon("warning"), do: theme_classes_for_icon(:warning)
  # defp classes_icon(_default), do: theme_classes_for_icon(:primary)
  defp classes_icon(theme) do
    [
      T.value(theme, :text),
      T.value(theme, :background),
      "bg-opacity-20"
    ]
  end


  defp icon(:cross) do
    ~E"""
    <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
    </svg>
    """
  end


end
