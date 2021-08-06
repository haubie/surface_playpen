defmodule SurfaceTailwind.Backdrop do
  @moduledoc """
  A full page **backdrop**.

  This component is used as the backdrop for full modals or when the screen needs to be taken over.

  By default it will center vertically and horizontally any slot added to it.

  For smaller screens (< sm breakpoint), the contents of the slot is moved towards the bottom of the screen.
  This is to support tapping on phones.
  """

  use Surface.Component
  # alias SurfaceTailwind.Theme, as: T

  @doc "CSS classes to propagate to the top level element <div>."
  prop class, :css_class

  @doc "Z-index to ensure that it is displayed over other page elements. Defaults to Tailwind's z-10 class."
  prop z, :css_class, default: "z-10"

  @doc "bg is the background of the backdrop. Defaults to Tailwind's bg-gray-500 class."
  prop bg, :css_class, default: "bg-gray-500"

  @doc "opacity of the backdrop. Defaults to Tailwind's opacity-75 class."
  prop opacity, :css_class, default: "opacity-75"

  @doc """
  The content to be placed into the backgrop. For an example, see the Modal dialog.
  """
  slot default

  def render(assigns) do
    ~H"""
    <div class={{"fixed inset-0 overflow-y-auto", @z, @class}}>
      <div class="flex items-end justify-center min-h-screen pt-4 px-4 pb-20 text-center sm:block sm:p-0">

        <div class="fixed inset-0" aria-hidden="true">
          <div class={{"absolute inset-0", @bg, @opacity}}></div>
        </div>

        <!-- This element is to trick the browser into centering the modal contents. -->
        <span class="hidden sm:inline-block sm:align-middle sm:h-screen" aria-hidden="true">&#8203;</span>

        <slot/>

      </div>
    </div>
    """
  end

end
