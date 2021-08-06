defmodule SurfacePlaypenWeb.PageLive do
  # use SurfacePlaypenWeb, :live_view
  use Surface.LiveView

  alias SurfaceTailwind.{Button,Alert,Grid,Breadcrumb,Accordion,AccordionItem,Modal,Backdrop}

  def icon(:new_page) do
    ~E"""
    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" class="w-6 h-6">
      <path fill-rule="evenodd" d="M6 2a2 2 0 00-2 2v12a2 2 0 002 2h8a2 2 0 002-2V7.414A2 2 0 0015.414 6L12 2.586A2 2 0 0010.586 2H6zm5 6a1 1 0 10-2 0v2H7a1 1 0 100 2h2v2a1 1 0 102 0v-2h2a1 1 0 100-2h-2V8z" clip-rule="evenodd" />
    </svg>
    """
  end

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div class="m-12">

    <h4 class="mt-4 font-semibold text-xl">Surface required:</h4>
    <ul>
      <li>Button - done</li>
      <li>Table</li>
      <li>Tabs</li>
      <li>Menu</li>
      <li>Modal - draft</li>
      <li>Form elements</li>
    </ul>

    <h4 class="mt-4 font-semibold text-xl">Other:</h4>

    <ul>
      <li>Accordion - done</li>
      <li>Alert - draft; need dismiss</li>
      <li>Notification - draft; need dismiss</li>
      <li>Breadcrumb - done</li>
      <li>Grid - done</li>

    </ul>

    <h4 class="mt-4 font-semibold text-xl">To do:</h4>

    <ul>

      <h4 class="mt-4 font-semibold text-xl">Other:</h4>


    </ul>




      Modal
      <Modal title="New page"
             message="Select from the page types below."
             icon={{ icon(:new_page) }}
             show=true>

          <ul class="mt-6 space-y-3 w-full">
            <li class="w-full">

              <a class="border rounded hover:bg-gray-50 hover:shadow-md hover:border-purple-900 hover:text-purple-900 p-3 inline-block w-full focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
                  <div class="font-bold">Standard page</div>
                  <div class="font-light text-xs">Used for most content pages.</div>
              </a>
            </li>
            <li class="w-full">

            <a class="border rounded hover:bg-gray-50 hover:shadow-md hover:border-purple-900 hover:text-purple-900 p-3 inline-block w-full focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
            <div class="font-bold">Product page</div>
                  <div class="font-light text-xs">Used for products for sale.</div>
                  </a>

            </li>

            <li class="w-full">

            <a class="border rounded hover:bg-gray-50 hover:shadow-md hover:border-purple-900 hover:text-purple-900 p-3 inline-block w-full focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
            <div class="font-bold">Recipe page</div>
                  <div class="font-light text-xs">Used for recipes.</div>
                  </a>

            </li>

            <li class="w-full">

            <a class="border rounded hover:bg-gray-50 hover:shadow-md hover:border-purple-900 hover:text-purple-900 p-3 inline-block w-full focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
            <div class="font-bold">Quiz page</div>
                  <div class="font-light text-xs">Used for quizzes.</div>
                  </a>

            </li>

          </ul>

      </Modal>

      <!-- <Backdrop>
        <div class="bg-white text-pink-900">Hello</div>
      </Backdrop> -->
    </div>





    Accordion
    <Accordion id="faq_accordion">
      <AccordionItem title="This is the title">Item 1</AccordionItem>
      <AccordionItem title="Some other item">This is the second item</AccordionItem>
    </Accordion>



    Types of separator:
    <Breadcrumb crumbs={{[%{name: "About", href: "/about"}, %{name: "Team", href: "/about/team"}, %{name: "Marius"}]}}/>
    <Breadcrumb crumbs={{[%{name: "About", href: "/about"}, %{name: "Team", href: "/about/team"}, %{name: "Marius"}]}} separator="cheveron"/>
    <Breadcrumb crumbs={{[%{name: "About", href: "/about"}, %{name: "Team", href: "/about/team"}, %{name: "Marius"}]}} separator="slash"/>
    <Breadcrumb crumbs={{[%{name: "About", href: "/about"}, %{name: "Team", href: "/about/team"}, %{name: "Marius"}]}} separator="divider"/>

    Colourful:
    <Breadcrumb crumbs={{[%{name: "About", href: "/about"}, %{name: "Team", href: "/about/team"}, %{name: "Marius"}]}} bordered=true border="border border-blue-600" border_radius="rounded-full" shadow="shadow-none" text="text-blue-600" background="bg-gradient-to-tl from-red-50 to-indigo-50"/>

    Add theme border
    <Breadcrumb crumbs={{[%{name: "About", href: "/about"}, %{name: "Team", href: "/about/team"}, %{name: "Marius"}]}} bordered=true/>

    Full width and bordered
    <Breadcrumb crumbs={{[%{name: "About", href: "/about"}, %{name: "Team", href: "/about/team"}, %{name: "Marius"}]}} separator="divider" bordered=true full_width=true/>

    Text colour
    <Breadcrumb crumbs={{[%{name: "About", href: "/about"}, %{name: "Team", href: "/about/team"}, %{name: "Marius"}]}} text="text-blue-500 hover:text-blue-900"/>
    <Breadcrumb crumbs={{[%{name: "About", href: "/about"}, %{name: "Team", href: "/about/team"}, %{name: "Marius"}]}} text="text-pink-500 hover:text-pink-900"/>
    <Breadcrumb crumbs={{[%{name: "About", href: "/about"}, %{name: "Team", href: "/about/team"}, %{name: "Marius"}]}} text="text-green-500 hover:text-green-900"/>




    <div class="m-12 space-y-8">
      <Breadcrumb crumbs={{[%{name: "Text 1", href: "#"}, %{name: "Text 2", href: "#"}, %{name: "Text 2"}]}} separator="slash" />

      <Breadcrumb crumbs={{[%{name: "Text 1", href: "#"}, %{name: "Text 2", href: "#"}, %{name: "Text 2"}]}} separator="divider" />

    </div>





    <h1 class="text-xl">Grid</h1>
    <Grid>
      <Alert>Default alert with the info styling.</Alert>

      <Alert type={{:warning}}>Warning alert styling.</Alert>

      <Alert type={{:error}}>Error alert styling.</Alert>
    </Grid>



    <div class="m-12 space-y-8">
      <Alert>Default alert with the info styling.</Alert>

      <Alert>Default alert with the info styling. <a href="#" class="px-2 underline hover:no-underline">Find out more &rarr;</a></Alert>

      <Alert type={{:warning}}>Warning alert styling.</Alert>

      <Alert type={{:error}}>Error alert styling.</Alert>

      <Alert type={{:error}} border="border-8 border-blue-900">Error alert styling with overriding of Tailwind CSS border classes.</Alert>
    </div>


    <div class="m-12">
      <p class="mb-2">Default (primary) theme</p>
      <Button>Default</Button>

      <p class="mt-4">Default with background and text overridden in prop</p>
      <Button background="bg-green-200 hover:bg-green-900" text="text-green-900 hover:text-white" class="my-4">Default + props</Button>

      <p>Primary theme</p>
      <Button theme={{:primary}} class="my-4">Primary theme</Button>

      <p>Secondary theme</p>
      <Button theme={{:secondary}} class="my-4">Secondary theme</Button>

      <p>Secondary varient theme</p>
      <Button theme={{:secondary_varient}} class="my-4">Secondary varient theme</Button>

      <p>Neutral theme</p>
      <Button theme={{:neutral}} class="my-4">Neutral theme</Button>

      <p>Tertiary theme</p>
      <Button theme={{:tertiary}} class="my-4">Tertiary theme</Button>

      <p>Primary gradient theme</p>
      <Button theme={{:primary_grad}} class="my-4">Primary grad theme</Button>

      <p>Secondary gradient theme</p>
      <Button theme={{:secondary_grad}} class="my-4">Secondary grad theme</Button>





      <p>Secondary theme with background and text overridden in prop</p>
      <Button theme={{:secondary}} background="bg-green-200 hover:bg-green-900" text="text-green-900 hover:text-white" class="my-4">Secondary theme + props</Button>

      <div class="mt-4">
      <Button theme={{:secondary}}>Secondary theme</Button> <Button>Default</Button>
      </div>
      <div class="mt-4">
      <Button theme={{:secondary}} alignment="inline-flex flex-col items-center justify-center" text_size="text-xs">
        <svg xmlns="http://www.w3.org/2000/svg" class="h-10 w-10" viewBox="0 0 20 20" fill="currentColor">
          <path d="M2 11a1 1 0 011-1h2a1 1 0 011 1v5a1 1 0 01-1 1H3a1 1 0 01-1-1v-5zM8 7a1 1 0 011-1h2a1 1 0 011 1v9a1 1 0 01-1 1H9a1 1 0 01-1-1V7zM14 4a1 1 0 011-1h2a1 1 0 011 1v12a1 1 0 01-1 1h-2a1 1 0 01-1-1V4z" />
        </svg>

        <div>Secondary theme</div>
      </Button>

      <Button text_size="text-xs">Default</Button>
      </div>
      <p class="mt-4">Button disabled</p>
      <Button class="my-4" disabled={{true}}>Disabled theme</Button>

      <p class="mt-4">Neutral</p>
      <Button theme={{:neutral}} class="my-4">Neutral theme</Button>
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
