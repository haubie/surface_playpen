defmodule SurfacePlaypenWeb.PageLive do
  # use SurfacePlaypenWeb, :live_view
  use Surface.LiveView

  alias SurfacePlaypenWeb.{TriviaCard,Heading}
  alias SurfaceTailwind.{Button,Alert}

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div class="m-12">
      <Alert class="my-4">This is a special message.</Alert>

      <Alert type={{:warn}} class="my-4">This is a special message.</Alert>

      <Alert type={{:error}} class="my-4">This is a special message.</Alert>

      <Alert type={{:error}} theme={{:neutral}} disabled=true class="my-4" border="border-8 border-blue-900">This is a special message.</Alert>
    </div>
    """
  end

  # def render(assigns) do
  #   ~H"""
  #   <div class="m-12">
  #     <p class="mb-2">Default (primary) theme</p>
  #     <Button>Default</Button>

  #     <p class="mt-4">Default with background and text overridden in prop</p>
  #     <Button background="bg-green-200 hover:bg-green-900" text="text-green-900 hover:text-white" class="my-4">Default + props</Button>

  #     <p>Secondary theme</p>
  #     <Button theme={{:secondary}} class="my-4">Secondary theme</Button>

  #     <p>Secondary theme with background and text overridden in prop</p>
  #     <Button theme={{:secondary}} background="bg-green-200 hover:bg-green-900" text="text-green-900 hover:text-white" class="my-4">Secondary theme + props</Button>

  #     <div class="mt-4">
  #     <Button theme={{:secondary}}>Secondary theme</Button> <Button>Default</Button>
  #     </div>
  #     <div class="mt-4">
  #     <Button theme={{:secondary}} alignment="inline-flex flex-col items-center justify-center" text_size="text-xs">
  #       <svg xmlns="http://www.w3.org/2000/svg" class="h-10 w-10" viewBox="0 0 20 20" fill="currentColor">
  #         <path d="M2 11a1 1 0 011-1h2a1 1 0 011 1v5a1 1 0 01-1 1H3a1 1 0 01-1-1v-5zM8 7a1 1 0 011-1h2a1 1 0 011 1v9a1 1 0 01-1 1H9a1 1 0 01-1-1V7zM14 4a1 1 0 011-1h2a1 1 0 011 1v12a1 1 0 01-1 1h-2a1 1 0 01-1-1V4z" />
  #       </svg>

  #       <div>Secondary theme</div>
  #     </Button>

  #     <Button text_size="text-xs">Default</Button>
  #     </div>
  #     <p class="mt-4">Disabled</p>
  #     <Button class="my-4" disabled={{true}}>Disabled theme</Button>

  #     <p class="mt-4">Neutral</p>
  #     <Button theme={{:neutral}} class="my-4">Neutral theme</Button>
  #   </div>
  #   <div class="m-12">
  #   <Alert type={{:warn}}>This is a special message.</Alert>
  #   </div>
  #   """
  # end

end
