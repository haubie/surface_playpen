defmodule SurfacePlaypenWeb.ContentPageLive do
  # use SurfacePlaypenWeb, :live_view
  use Surface.LiveView

  alias SurfaceTailwind.{But,Button,Alert,Grid,Breadcrumb,Notification,Icon}
  alias SurfaceTailwind.Tabs
  alias SurfaceTailwind.Tabs.TabItem
  alias SurfaceTailwind.Accordion
  alias SurfaceTailwind.Accordion.AccordionItem
  alias SurfaceTailwind.Menu
  alias SurfaceTailwind.Menu.MenuItem
  alias SurfaceTailwind.Menu.MenuGroup


  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def render(assigns) do
    ~F"""
    <div class="mx-12 px-12 bg-gray-50">

    <h1 class="mt-12 mb-3 text-xl">Alert examples</h1>

    <div class="space-y-6">

    <Alert class="my-3">Remember to sign up!</Alert>

    <Alert type={:warning}>Warning alert styling.</Alert>

    <Alert type={:error}>Error alert styling.</Alert>


    <Alert border="border-8 border-blue-900 border-opacity-40"
       background="bg-gradient-to-r from-red-100 to-indigo-100"
       text="text-blue-900 font-semibold">
       Error alert styling with overriding
       of Tailwind CSS border classes.
       <a href="#"
          class="inline-block underline hover:no-underline">
          More info &rarr;
       </a>
    </Alert>
    </div>



    <h1 class="mt-12 mb-3 text-xl">Breadcrumb example</h1>
    <Breadcrumb crumbs={[%{name: "About", href: "/about"}, %{name: "Team", href: "/about/team"}, %{name: "Person name"}]} bordered={true} margin="mt-3" />


    <div class="my-2">

    <h1 class="mt-12 mb-3 text-xl">Vertical menu example</h1>

    <div>
    <Menu title="Menu title">

      <MenuItem title="Href link" label="12" icon="home" href="https://google.com.au" opts={[target: "_blank"]} />
      <MenuItem title="Patch to /" label="2" icon="new_page" patch="/" />
      <MenuItem title="Redirect to /" label="2" icon="home" redirect="/" />
    </Menu>
    </div>

    <h1 class="mt-12 mb-3 text-xl">Vertical menu examples with Menu Groups</h1>


      <Menu>

        <MenuGroup title="Atoms">
          <MenuItem title="Group menu item 1" label="12" icon="home" />
          <MenuItem title="Stuff" label="12" icon="home" />
          <MenuItem title="Stuff" label="2" icon="home" />
        </MenuGroup>

        <MenuGroup title="Organisms">
          <MenuItem title="Group menu item 1" label="12" icon="new_page" />
          <MenuItem title="Stuff" label="12" icon="new_page" />
          <MenuItem title="Stuff" label="2" icon="new_page" />
        </MenuGroup>

        <MenuGroup title="Molecules">
          <MenuItem title="Group menu item 1" label="12" icon="new_page" />
          <MenuItem title="Stuff" label="12" icon="new_page" />
          <MenuItem title="Stuff" label="2" icon="new_page" />
        </MenuGroup>

      </Menu>

    </div>


    <h1 class="mt-12 mb-3 text-xl">Icon examples</h1>

    <div class="my-2 text-gray-400">
      <Icon icon="tick" />
      <Icon icon="tick" theme={:success} />
      <Icon icon="cross" />
      <Icon icon="cross" colour="text-red-800" />
      <Icon icon="cross" w="w-12" h="h-12" />
    </div>

    <div class="flex flex-col space-y-6">

    <h1 class="mt-12 mb-3 text-xl">Overiding tabs with larger text</h1>

    <Tabs id="surface_gallery3232" tab_text="text-xl" tab_font="font-thin">
        <TabItem label="Properties very long menu" icon="tick">
        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras nibh metus, pharetra id velit nec, ultrices ornare ipsum. Vestibulum id ultricies diam, luctus accumsan felis. Nulla nec feugiat ipsum. Mauris ultricies consectetur arcu at varius. Pellentesque maximus iaculis metus venenatis tempor. Pellentesque nulla libero, aliquet at magna sit amet, laoreet vestibulum diam. Aenean auctor efficitur est ut rhoncus. Curabitur mollis lorem arcu, a lobortis leo sagittis ut. Donec faucibus diam ut gravida tincidunt. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque aliquam neque eu malesuada condimentum.
        </TabItem>
        <TabItem label="Slots">Hello 1 Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras nibh metus, pharetra id velit nec, ultrices ornare ipsum. Vestibulum id ultricies diam, luctus accumsan felis. Nulla nec feugiat ipsum. Mauris ultricies consectetur arcu at varius. Pellentesque maximus iaculis metus venenatis tempor. Pellentesque nulla libero, aliquet at magna sit amet, laoreet vestibulum diam. Aenean auctor efficitur est ut rhoncus. Curabitur mollis lorem arcu, a lobortis leo sagittis ut. Donec faucibus diam ut gravida tincidunt. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque aliquam neque eu malesuada condimentum. </TabItem>
        <TabItem label="Events">Hello Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras nibh metus, pharetra id velit nec, ultrices ornare ipsum. Vestibulum id ultricies diam, luctus accumsan felis. Nulla nec feugiat ipsum. Mauris ultricies consectetur arcu at varius. Pellentesque maximus iaculis metus venenatis tempor. Pellentesque nulla libero, aliquet at magna sit amet, laoreet vestibulum diam. Aenean auctor efficitur est ut rhoncus. Curabitur mollis lorem arcu, a lobortis leo sagittis ut. Donec faucibus diam ut gravida tincidunt. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque aliquam neque eu malesuada condimentum.1</TabItem>
        <TabItem label="Functions">Functions Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras nibh metus, pharetra id velit nec, ultrices ornare ipsum. Vestibulum id ultricies diam, luctus accumsan felis. Nulla nec feugiat ipsum. Mauris ultricies consectetur arcu at varius. Pellentesque maximus iaculis metus venenatis tempor. Pellentesque nulla libero, aliquet at magna sit amet, laoreet vestibulum diam. Aenean auctor efficitur est ut rhoncus. Curabitur mollis lorem arcu, a lobortis leo sagittis ut. Donec faucibus diam ut gravida tincidunt. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque aliquam neque eu malesuada condimentum.</TabItem>
    </Tabs>


    <h1 class="mt-12 mb-3 text-xl">Default tabs, plus adding an icon to first</h1>


    <Tabs id="surface_gallery">
        <TabItem label="Properties very long menu" icon="tick">
         Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras nibh metus, pharetra id velit nec, ultrices ornare ipsum. Vestibulum id ultricies diam, luctus accumsan felis. Nulla nec feugiat ipsum. Mauris ultricies consectetur arcu at varius. Pellentesque maximus iaculis metus venenatis tempor. Pellentesque nulla libero, aliquet at magna sit amet, laoreet vestibulum diam. Aenean auctor efficitur est ut rhoncus. Curabitur mollis lorem arcu, a lobortis leo sagittis ut. Donec faucibus diam ut gravida tincidunt. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque aliquam neque eu malesuada condimentum.
        </TabItem>
        <TabItem label="Slots">Hello 1 Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras nibh metus, pharetra id velit nec, ultrices ornare ipsum. Vestibulum id ultricies diam, luctus accumsan felis. Nulla nec feugiat ipsum. Mauris ultricies consectetur arcu at varius. Pellentesque maximus iaculis metus venenatis tempor. Pellentesque nulla libero, aliquet at magna sit amet, laoreet vestibulum diam. Aenean auctor efficitur est ut rhoncus. Curabitur mollis lorem arcu, a lobortis leo sagittis ut. Donec faucibus diam ut gravida tincidunt. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque aliquam neque eu malesuada condimentum. </TabItem>
        <TabItem label="Events">Hello Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras nibh metus, pharetra id velit nec, ultrices ornare ipsum. Vestibulum id ultricies diam, luctus accumsan felis. Nulla nec feugiat ipsum. Mauris ultricies consectetur arcu at varius. Pellentesque maximus iaculis metus venenatis tempor. Pellentesque nulla libero, aliquet at magna sit amet, laoreet vestibulum diam. Aenean auctor efficitur est ut rhoncus. Curabitur mollis lorem arcu, a lobortis leo sagittis ut. Donec faucibus diam ut gravida tincidunt. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque aliquam neque eu malesuada condimentum.1</TabItem>
        <TabItem label="Functions">Functions Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras nibh metus, pharetra id velit nec, ultrices ornare ipsum. Vestibulum id ultricies diam, luctus accumsan felis. Nulla nec feugiat ipsum. Mauris ultricies consectetur arcu at varius. Pellentesque maximus iaculis metus venenatis tempor. Pellentesque nulla libero, aliquet at magna sit amet, laoreet vestibulum diam. Aenean auctor efficitur est ut rhoncus. Curabitur mollis lorem arcu, a lobortis leo sagittis ut. Donec faucibus diam ut gravida tincidunt. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque aliquam neque eu malesuada condimentum.</TabItem>
    </Tabs>


    <h1 class="mt-12 mb-3 text-xl">Tabs growing to the width</h1>


    <Tabs id="surface_gallery2" flex="flex-grow">
        <TabItem label="Properties very long menu" icon="tick">
        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras nibh metus, pharetra id velit nec, ultrices ornare ipsum. Vestibulum id ultricies diam, luctus accumsan felis. Nulla nec feugiat ipsum. Mauris ultricies consectetur arcu at varius. Pellentesque maximus iaculis metus venenatis tempor. Pellentesque nulla libero, aliquet at magna sit amet, laoreet vestibulum diam. Aenean auctor efficitur est ut rhoncus. Curabitur mollis lorem arcu, a lobortis leo sagittis ut. Donec faucibus diam ut gravida tincidunt. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque aliquam neque eu malesuada condimentum.
        </TabItem>
        <TabItem label="Slots">Hello 1 Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras nibh metus, pharetra id velit nec, ultrices ornare ipsum. Vestibulum id ultricies diam, luctus accumsan felis. Nulla nec feugiat ipsum. Mauris ultricies consectetur arcu at varius. Pellentesque maximus iaculis metus venenatis tempor. Pellentesque nulla libero, aliquet at magna sit amet, laoreet vestibulum diam. Aenean auctor efficitur est ut rhoncus. Curabitur mollis lorem arcu, a lobortis leo sagittis ut. Donec faucibus diam ut gravida tincidunt. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque aliquam neque eu malesuada condimentum. </TabItem>
        <TabItem label="Events">Hello Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras nibh metus, pharetra id velit nec, ultrices ornare ipsum. Vestibulum id ultricies diam, luctus accumsan felis. Nulla nec feugiat ipsum. Mauris ultricies consectetur arcu at varius. Pellentesque maximus iaculis metus venenatis tempor. Pellentesque nulla libero, aliquet at magna sit amet, laoreet vestibulum diam. Aenean auctor efficitur est ut rhoncus. Curabitur mollis lorem arcu, a lobortis leo sagittis ut. Donec faucibus diam ut gravida tincidunt. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque aliquam neque eu malesuada condimentum.1</TabItem>
        <TabItem label="Functions">Functions Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras nibh metus, pharetra id velit nec, ultrices ornare ipsum. Vestibulum id ultricies diam, luctus accumsan felis. Nulla nec feugiat ipsum. Mauris ultricies consectetur arcu at varius. Pellentesque maximus iaculis metus venenatis tempor. Pellentesque nulla libero, aliquet at magna sit amet, laoreet vestibulum diam. Aenean auctor efficitur est ut rhoncus. Curabitur mollis lorem arcu, a lobortis leo sagittis ut. Donec faucibus diam ut gravida tincidunt. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque aliquam neque eu malesuada condimentum.</TabItem>
    </Tabs>


    <h1 class="mt-12 mb-3 text-xl">Button style tabs</h1>

    <Tabs id="surface_gallery3" style="button">
        <TabItem label="Properties very long menu" icon="tick">
        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras nibh metus, pharetra id velit nec, ultrices ornare ipsum. Vestibulum id ultricies diam, luctus accumsan felis. Nulla nec feugiat ipsum. Mauris ultricies consectetur arcu at varius. Pellentesque maximus iaculis metus venenatis tempor. Pellentesque nulla libero, aliquet at magna sit amet, laoreet vestibulum diam. Aenean auctor efficitur est ut rhoncus. Curabitur mollis lorem arcu, a lobortis leo sagittis ut. Donec faucibus diam ut gravida tincidunt. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque aliquam neque eu malesuada condimentum.
        </TabItem>
        <TabItem label="Slots">Hello 1 Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras nibh metus, pharetra id velit nec, ultrices ornare ipsum. Vestibulum id ultricies diam, luctus accumsan felis. Nulla nec feugiat ipsum. Mauris ultricies consectetur arcu at varius. Pellentesque maximus iaculis metus venenatis tempor. Pellentesque nulla libero, aliquet at magna sit amet, laoreet vestibulum diam. Aenean auctor efficitur est ut rhoncus. Curabitur mollis lorem arcu, a lobortis leo sagittis ut. Donec faucibus diam ut gravida tincidunt. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque aliquam neque eu malesuada condimentum. </TabItem>
        <TabItem label="Events">Hello Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras nibh metus, pharetra id velit nec, ultrices ornare ipsum. Vestibulum id ultricies diam, luctus accumsan felis. Nulla nec feugiat ipsum. Mauris ultricies consectetur arcu at varius. Pellentesque maximus iaculis metus venenatis tempor. Pellentesque nulla libero, aliquet at magna sit amet, laoreet vestibulum diam. Aenean auctor efficitur est ut rhoncus. Curabitur mollis lorem arcu, a lobortis leo sagittis ut. Donec faucibus diam ut gravida tincidunt. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque aliquam neque eu malesuada condimentum.1</TabItem>
        <TabItem label="Functions">Functions Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras nibh metus, pharetra id velit nec, ultrices ornare ipsum. Vestibulum id ultricies diam, luctus accumsan felis. Nulla nec feugiat ipsum. Mauris ultricies consectetur arcu at varius. Pellentesque maximus iaculis metus venenatis tempor. Pellentesque nulla libero, aliquet at magna sit amet, laoreet vestibulum diam. Aenean auctor efficitur est ut rhoncus. Curabitur mollis lorem arcu, a lobortis leo sagittis ut. Donec faucibus diam ut gravida tincidunt. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque aliquam neque eu malesuada condimentum.</TabItem>
    </Tabs>

    <h1 class="mt-12 mb-3 text-xl">Applying the :secondary theme to the tabs</h1>

    <Tabs id="surface_gallery5" style="button" theme={:secondary}>
        <TabItem label="Properties very long menu" icon="tick">
        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras nibh metus, pharetra id velit nec, ultrices ornare ipsum. Vestibulum id ultricies diam, luctus accumsan felis. Nulla nec feugiat ipsum. Mauris ultricies consectetur arcu at varius. Pellentesque maximus iaculis metus venenatis tempor. Pellentesque nulla libero, aliquet at magna sit amet, laoreet vestibulum diam. Aenean auctor efficitur est ut rhoncus. Curabitur mollis lorem arcu, a lobortis leo sagittis ut. Donec faucibus diam ut gravida tincidunt. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque aliquam neque eu malesuada condimentum.
        </TabItem>
        <TabItem label="Slots">Hello 1 Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras nibh metus, pharetra id velit nec, ultrices ornare ipsum. Vestibulum id ultricies diam, luctus accumsan felis. Nulla nec feugiat ipsum. Mauris ultricies consectetur arcu at varius. Pellentesque maximus iaculis metus venenatis tempor. Pellentesque nulla libero, aliquet at magna sit amet, laoreet vestibulum diam. Aenean auctor efficitur est ut rhoncus. Curabitur mollis lorem arcu, a lobortis leo sagittis ut. Donec faucibus diam ut gravida tincidunt. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque aliquam neque eu malesuada condimentum. </TabItem>
        <TabItem label="Events">Hello Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras nibh metus, pharetra id velit nec, ultrices ornare ipsum. Vestibulum id ultricies diam, luctus accumsan felis. Nulla nec feugiat ipsum. Mauris ultricies consectetur arcu at varius. Pellentesque maximus iaculis metus venenatis tempor. Pellentesque nulla libero, aliquet at magna sit amet, laoreet vestibulum diam. Aenean auctor efficitur est ut rhoncus. Curabitur mollis lorem arcu, a lobortis leo sagittis ut. Donec faucibus diam ut gravida tincidunt. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque aliquam neque eu malesuada condimentum.1</TabItem>
        <TabItem label="Functions">Functions Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras nibh metus, pharetra id velit nec, ultrices ornare ipsum. Vestibulum id ultricies diam, luctus accumsan felis. Nulla nec feugiat ipsum. Mauris ultricies consectetur arcu at varius. Pellentesque maximus iaculis metus venenatis tempor. Pellentesque nulla libero, aliquet at magna sit amet, laoreet vestibulum diam. Aenean auctor efficitur est ut rhoncus. Curabitur mollis lorem arcu, a lobortis leo sagittis ut. Donec faucibus diam ut gravida tincidunt. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque aliquam neque eu malesuada condimentum.</TabItem>
    </Tabs>

    <h1 class="mt-12 mb-3 text-xl">Applying the :menu theme to the tabs</h1>

    <Tabs id="surface_gallery6" style="button" theme={:menu} flex="flex-grow">
      <TabItem label="Properties very long menu" icon="tick">
      Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras nibh metus, pharetra id velit nec, ultrices ornare ipsum. Vestibulum id ultricies diam, luctus accumsan felis. Nulla nec feugiat ipsum. Mauris ultricies consectetur arcu at varius. Pellentesque maximus iaculis metus venenatis tempor. Pellentesque nulla libero, aliquet at magna sit amet, laoreet vestibulum diam. Aenean auctor efficitur est ut rhoncus. Curabitur mollis lorem arcu, a lobortis leo sagittis ut. Donec faucibus diam ut gravida tincidunt. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque aliquam neque eu malesuada condimentum.
      </TabItem>
      <TabItem label="Slots">Hello 1 Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras nibh metus, pharetra id velit nec, ultrices ornare ipsum. Vestibulum id ultricies diam, luctus accumsan felis. Nulla nec feugiat ipsum. Mauris ultricies consectetur arcu at varius. Pellentesque maximus iaculis metus venenatis tempor. Pellentesque nulla libero, aliquet at magna sit amet, laoreet vestibulum diam. Aenean auctor efficitur est ut rhoncus. Curabitur mollis lorem arcu, a lobortis leo sagittis ut. Donec faucibus diam ut gravida tincidunt. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque aliquam neque eu malesuada condimentum. </TabItem>
      <TabItem label="Events">Hello Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras nibh metus, pharetra id velit nec, ultrices ornare ipsum. Vestibulum id ultricies diam, luctus accumsan felis. Nulla nec feugiat ipsum. Mauris ultricies consectetur arcu at varius. Pellentesque maximus iaculis metus venenatis tempor. Pellentesque nulla libero, aliquet at magna sit amet, laoreet vestibulum diam. Aenean auctor efficitur est ut rhoncus. Curabitur mollis lorem arcu, a lobortis leo sagittis ut. Donec faucibus diam ut gravida tincidunt. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque aliquam neque eu malesuada condimentum.1</TabItem>
      <TabItem label="Functions">Functions Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras nibh metus, pharetra id velit nec, ultrices ornare ipsum. Vestibulum id ultricies diam, luctus accumsan felis. Nulla nec feugiat ipsum. Mauris ultricies consectetur arcu at varius. Pellentesque maximus iaculis metus venenatis tempor. Pellentesque nulla libero, aliquet at magna sit amet, laoreet vestibulum diam. Aenean auctor efficitur est ut rhoncus. Curabitur mollis lorem arcu, a lobortis leo sagittis ut. Donec faucibus diam ut gravida tincidunt. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque aliquam neque eu malesuada condimentum.</TabItem>
    </Tabs>


    <h1 class="mt-12 mb-3 text-xl">Setting tab location to the left</h1>


    <Tabs id="surface_gallery7" location="left">
      <TabItem label="Properties">
      Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras nibh metus, pharetra id velit nec, ultrices ornare ipsum. Vestibulum id ultricies diam, luctus accumsan felis. Nulla nec feugiat ipsum. Mauris ultricies consectetur arcu at varius. Pellentesque maximus iaculis metus venenatis tempor. Pellentesque nulla libero, aliquet at magna sit amet, laoreet vestibulum diam. Aenean auctor efficitur est ut rhoncus. Curabitur mollis lorem arcu, a lobortis leo sagittis ut. Donec faucibus diam ut gravida tincidunt. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque aliquam neque eu malesuada condimentum.
      </TabItem>
      <TabItem label="Slots">Hello 1 Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras nibh metus, pharetra id velit nec, ultrices ornare ipsum. Vestibulum id ultricies diam, luctus accumsan felis. Nulla nec feugiat ipsum. Mauris ultricies consectetur arcu at varius. Pellentesque maximus iaculis metus venenatis tempor. Pellentesque nulla libero, aliquet at magna sit amet, laoreet vestibulum diam. Aenean auctor efficitur est ut rhoncus. Curabitur mollis lorem arcu, a lobortis leo sagittis ut. Donec faucibus diam ut gravida tincidunt. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque aliquam neque eu malesuada condimentum. </TabItem>
      <TabItem label="Events">Hello Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras nibh metus, pharetra id velit nec, ultrices ornare ipsum. Vestibulum id ultricies diam, luctus accumsan felis. Nulla nec feugiat ipsum. Mauris ultricies consectetur arcu at varius. Pellentesque maximus iaculis metus venenatis tempor. Pellentesque nulla libero, aliquet at magna sit amet, laoreet vestibulum diam. Aenean auctor efficitur est ut rhoncus. Curabitur mollis lorem arcu, a lobortis leo sagittis ut. Donec faucibus diam ut gravida tincidunt. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque aliquam neque eu malesuada condimentum.1</TabItem>
      <TabItem label="Functions">Functions Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras nibh metus, pharetra id velit nec, ultrices ornare ipsum. Vestibulum id ultricies diam, luctus accumsan felis. Nulla nec feugiat ipsum. Mauris ultricies consectetur arcu at varius. Pellentesque maximus iaculis metus venenatis tempor. Pellentesque nulla libero, aliquet at magna sit amet, laoreet vestibulum diam. Aenean auctor efficitur est ut rhoncus. Curabitur mollis lorem arcu, a lobortis leo sagittis ut. Donec faucibus diam ut gravida tincidunt. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque aliquam neque eu malesuada condimentum.</TabItem>
    </Tabs>


    <h1 class="mt-12 mb-3 text-xl">Setting tab location to the left with button style</h1>

    <Tabs id="surface_gallery8" location="left" style="button">
      <TabItem label="Properties very long menu">
      Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras nibh metus, pharetra id velit nec, ultrices ornare ipsum. Vestibulum id ultricies diam, luctus accumsan felis. Nulla nec feugiat ipsum. Mauris ultricies consectetur arcu at varius. Pellentesque maximus iaculis metus venenatis tempor. Pellentesque nulla libero, aliquet at magna sit amet, laoreet vestibulum diam. Aenean auctor efficitur est ut rhoncus. Curabitur mollis lorem arcu, a lobortis leo sagittis ut. Donec faucibus diam ut gravida tincidunt. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque aliquam neque eu malesuada condimentum.
      </TabItem>
      <TabItem label="Slots">Hello 1 Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras nibh metus, pharetra id velit nec, ultrices ornare ipsum. Vestibulum id ultricies diam, luctus accumsan felis. Nulla nec feugiat ipsum. Mauris ultricies consectetur arcu at varius. Pellentesque maximus iaculis metus venenatis tempor. Pellentesque nulla libero, aliquet at magna sit amet, laoreet vestibulum diam. Aenean auctor efficitur est ut rhoncus. Curabitur mollis lorem arcu, a lobortis leo sagittis ut. Donec faucibus diam ut gravida tincidunt. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque aliquam neque eu malesuada condimentum. </TabItem>
      <TabItem label="Events">Hello Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras nibh metus, pharetra id velit nec, ultrices ornare ipsum. Vestibulum id ultricies diam, luctus accumsan felis. Nulla nec feugiat ipsum. Mauris ultricies consectetur arcu at varius. Pellentesque maximus iaculis metus venenatis tempor. Pellentesque nulla libero, aliquet at magna sit amet, laoreet vestibulum diam. Aenean auctor efficitur est ut rhoncus. Curabitur mollis lorem arcu, a lobortis leo sagittis ut. Donec faucibus diam ut gravida tincidunt. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque aliquam neque eu malesuada condimentum.1</TabItem>
      <TabItem label="Functions">Functions Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras nibh metus, pharetra id velit nec, ultrices ornare ipsum. Vestibulum id ultricies diam, luctus accumsan felis. Nulla nec feugiat ipsum. Mauris ultricies consectetur arcu at varius. Pellentesque maximus iaculis metus venenatis tempor. Pellentesque nulla libero, aliquet at magna sit amet, laoreet vestibulum diam. Aenean auctor efficitur est ut rhoncus. Curabitur mollis lorem arcu, a lobortis leo sagittis ut. Donec faucibus diam ut gravida tincidunt. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque aliquam neque eu malesuada condimentum.</TabItem>
    </Tabs>
    </div>



    <h1 class="mt-12 mb-3 text-xl">Notification examples</h1>


    <Notification title="No actions" class="mt-12">
      Quisque pede tellus, dictum eget, dapibus ac, sodales dictum, lectus.
      Pellentesque mi dui, molestie sit amet, adipiscing id, iaculis quis, arcu.
    </Notification>


    <Notification title="Inline action" action_location={:inline} class="mt-12"/>

    <Notification title="Icon added" icon={:tick} class="mt-12">
      Quisque pede tellus, dictum eget, dapibus ac, sodales dictum, lectus.
      Pellentesque mi dui, molestie sit amet, adipiscing id, iaculis quis, arcu.
    </Notification>

    <Notification title="Bottom actions" icon={:tick} class="mt-12" action_location={:bottom}
                  secondary_action={"Event"}>
      Quisque pede tellus, dictum eget, dapibus ac, sodales dictum, lectus.
      Pellentesque mi dui, molestie sit amet, adipiscing id, iaculis quis, arcu.
    </Notification>

    <Notification title="Bottom actions, with theme" icon={:tick} class="mt-12" action_location={:bottom}
        secondary_action={"Event"} theme={:alert}>
    Quisque pede tellus, dictum eget, dapibus ac, sodales dictum, lectus.
    Pellentesque mi dui, molestie sit amet, adipiscing id, iaculis quis, arcu.
    </Notification>

    <Notification title="Bottom actions, with theme" icon={:tick} class="mt-12" action_location={:bottom}
        secondary_action={"Event"} theme={:success}>
    Quisque pede tellus, dictum eget, dapibus ac, sodales dictum, lectus.
    Pellentesque mi dui, molestie sit amet, adipiscing id, iaculis quis, arcu.
    </Notification>

    <Notification title="Bottom actions, with theme" icon={:tick} class="mt-12" action_location={:bottom}
    secondary_action={"Event"} theme={:warning}>
Quisque pede tellus, dictum eget, dapibus ac, sodales dictum, lectus.
Pellentesque mi dui, molestie sit amet, adipiscing id, iaculis quis, arcu.
</Notification>

    <Notification title="Action right, single"
                  icon={:tick}
                  class="mt-12"
                  action_location={:right}>
      Quisque pede tellus, dictum eget, dapibus ac, sodales dictum, lectus.
      Pellentesque mi dui, molestie sit amet, adipiscing id, iaculis quis, arcu.
    </Notification>

    <Notification title="Action right, dual"
                  icon={:tick}
                  class="mt-12"
                  action_location={:right}
                  secondary_action={"secondary_action"}>
      Quisque pede tellus, dictum eget, dapibus ac, sodales dictum, lectus.
      Pellentesque mi dui, molestie sit amet, adipiscing id, iaculis quis, arcu.
    </Notification>

    <!-- <Notification title="No slot, title only, action to right" icon={:tick} action_location={:right} class="mt-12 absolute top-10 right-10" />
    -->
    <Notification title="No slot, title only, no action" icon={:tick} class="mt-12" />

    <Notification title="No slot, title only, no action" class="mt-12" />



    <Notification title="Discussion archived" icon={:tick} class="mt-12" action_location={:buttom}>
      Quisque pede tellus, dictum eget, dapibus ac, sodales dictum, lectus.
      Pellentesque mi dui, molestie sit amet, adipiscing id, iaculis quis, arcu.
    </Notification>

    <h1 class="mt-12 mb-3 text-xl">Accordion example, in a Grid container layout</h1>

    <Grid gap="gap-8">

    <Accordion id="faq_accordion" margin="my-8">
      <AccordionItem title="This is the title">Item 1</AccordionItem>
      <AccordionItem title="Some other item">This is the second item</AccordionItem>
    </Accordion>


    <Accordion id="faq_accordion_2" margin="my-8" theme={:secondary}>
      <AccordionItem title="This is the title">Item 1</AccordionItem>
      <AccordionItem title="Some other item">This is the second item</AccordionItem>
    </Accordion>


    <Accordion id="faq_accordion_3" margin="my-8" theme={:secondary_varient}>
      <AccordionItem title="This is the title">Item 1</AccordionItem>
      <AccordionItem title="Some other item">This is the second item</AccordionItem>
    </Accordion>


      <Accordion id="faq_accordion_4" margin="my-8" theme={:neutral}>
        <AccordionItem title="This is the title">Item 1</AccordionItem>
        <AccordionItem title="Some other item">This is the second item</AccordionItem>
      </Accordion>

      <Accordion id="faq_accordion_5" margin="my-8" theme={:tertiary}>
        <AccordionItem title="This is the title">Item 1</AccordionItem>
        <AccordionItem title="Some other item">This is the second item</AccordionItem>
      </Accordion>
    </Grid>



    </div>
    """
  end

end
