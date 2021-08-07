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
  alias SurfaceTailwind.{Button, Backdrop, Icon}
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
    ~F"""
    <div id="simple_modal" :if={@show}>
      <Backdrop>

          <div class={"inline-block bg-white rounded-lg text-left overflow-hidden shadow-xl transform transition-all sm:my-8 align-middle w-full sm:max-w-lg", @class} role="dialog" aria-modal="true" aria-labelledby="modal-headline">
            <div class="px-4 pt-5 pb-4 sm:p-6 sm:pb-4">

              <div class="sm:flex sm:items-start mr-0 sm:mr-3">

                <div :if={@icon} class={"mx-auto flex-shrink-0 flex items-center justify-center h-12 w-12 rounded-full sm:mx-0 sm:h-10 sm:w-10", classes_icon(@theme)}>
                  <Icon icon={@icon} w="w-6" h="h-6" />
                </div>

                <div class="mt-3 text-center sm:mt-0 sm:ml-4 sm:text-left w-full">

                  <h3 class="text-lg leading-6 font-medium text-gray-900" id="modal-headline">
                    {@title}
                  </h3>

                  <div class="mt-2 w-full text-sm text-gray-500">
                    <p>
                      {@message}
                    </p>
                    <div class="w-full max-h-96 overflow-auto overscroll-contain">
                      <#slot/>

                      Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum vitae justo augue. Fusce fermentum, nunc eu faucibus vehicula, risus mauris volutpat neque, eget elementum dolor ligula quis mi. Aliquam commodo dolor sed porta tempus. Integer rhoncus ultricies urna. Cras a consequat justo. Aenean ac ante odio. Nam vitae magna ultricies risus scelerisque vehicula sit amet quis turpis. Maecenas et ligula bibendum, congue quam vitae, tincidunt nunc. Phasellus tristique nisl porttitor erat maximus laoreet ut eget sem. Maecenas porta mollis pellentesque. Vestibulum posuere ullamcorper diam, ac pulvinar purus sodales vel. Ut non posuere orci. Suspendisse potenti. Pellentesque maximus libero magna, vel commodo risus vestibulum nec.

Quisque gravida interdum nisl quis sagittis. Etiam orci lorem, aliquam id vestibulum facilisis, consequat et nibh. Sed nec porta justo, imperdiet efficitur tortor. Maecenas cursus porttitor posuere. Cras id nisl tempus, pharetra lectus vel, maximus turpis. Nunc tincidunt nisl vel ultrices facilisis. Curabitur non varius turpis. Morbi efficitur leo ut arcu porttitor, id luctus nunc lobortis. Quisque ut nunc malesuada, rhoncus ipsum id, volutpat mauris.

Maecenas vitae interdum augue. Nulla aliquet orci vitae ante efficitur faucibus. Donec hendrerit mauris purus, luctus interdum nisi congue efficitur. Aliquam placerat, erat sed pellentesque convallis, turpis tortor auctor tortor, sit amet aliquam leo massa non elit. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Cras eget vehicula neque, ut varius mauris. Curabitur feugiat tincidunt est, varius suscipit lectus elementum eget.

Sed tristique nibh quis neque varius consequat. Curabitur tincidunt et mi non convallis. Praesent porta tellus ornare quam vulputate, feugiat tincidunt magna venenatis. Mauris eu neque varius, egestas ipsum ullamcorper, molestie lacus. Pellentesque egestas leo eget dapibus elementum. Suspendisse et nunc ex. Mauris commodo erat eu erat congue, eget finibus lacus mattis. Nunc in sapien sit amet ex posuere interdum id id sem. Morbi sagittis tristique ultricies. Integer imperdiet vestibulum nunc, ut elementum lectus tristique non.

Integer viverra posuere lorem, a tincidunt lacus consectetur id. Aenean porttitor pretium enim, a molestie ex maximus vel. Curabitur interdum ante ante, sit amet ultrices nisl rhoncus quis. Quisque ultrices malesuada scelerisque. Morbi a laoreet risus, vel tristique ipsum. Integer purus felis, efficitur eu pharetra cursus, commodo at augue. Etiam egestas, sem ut tristique interdum, ex arcu porttitor lectus, ut dignissim velit justo eu sem. Ut tincidunt malesuada mattis. Nullam interdum porta felis, ultrices accumsan sapien. Quisque at odio nulla. Mauris sit amet eros aliquam, feugiat lacus sit amet, tincidunt ipsum.
                    </div>
                  </div>

                </div>
              </div>
            </div>

            <div class="bg-gray-50 px-4 py-3 sm:px-6 flex flex-row-reverse space-x-reverse space-x-3">
              <Button theme={classes_primary_button(@theme)} click={@action} >Accept</Button>
              <Button theme={:neutral} click={@secondary_action} >Cancel</Button>
            </div>

          </div>

        </Backdrop>
    </div>
    """
  end

  defp classes_primary_button(:alert), do: :error
  defp classes_primary_button(theme), do: theme


  defp classes_icon(:alert), do: classes_icon(:error)
  defp classes_icon(theme) do
    [
      T.value(theme, :text),
      T.value(theme, :background),
      "bg-opacity-20"
    ]
  end


end
