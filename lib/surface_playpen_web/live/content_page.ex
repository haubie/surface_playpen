defmodule SurfacePlaypenWeb.ContentPageLive do
  # use SurfacePlaypenWeb, :live_view
  use Surface.LiveView

  alias SurfaceTailwind.{But,Button,Alert,Grid,Breadcrumb,Notification,Icon}
  alias SurfaceTailwind.Tabs
  alias SurfaceTailwind.Tabs.TabItem
  alias SurfaceTailwind.Accordion
  alias SurfaceTailwind.Accordion.AccordionItem

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div class="mx-12 px-12 bg-gray-50">

    <Alert class="my-3">Remember to sign up!</Alert>

    <div class="h-16 bg-gray-800 flex flex-row text-white items-center px-10 space-x-4">
      <div class="flex flex-row items-center">
        <svg id="Capa_1" class="h-10 w-10" enable-background="new 0 0 510.95 510.95" height="512" viewBox="0 0 510.95 510.95" width="512" xmlns="http://www.w3.org/2000/svg"><g><g><path d="m342.528 459.558-267.661-.088c-41.24.012-74.825-33.646-74.867-75.066-.002-19.973 7.813-38.852 22.029-52.989 14.183-14.087 33.007-21.848 53.05-21.873l88.148.074c3.215.006 6.332 1.034 8.918 2.946l146.5 108.418c3.196 2.47 7.112 4.575 11.323 6.068 4.473 1.587 8.803 2.439 12.878 2.517 10.201.207 17.245 10.362 13.822 20.011-2.066 5.825-7.617 9.995-14.14 9.982z" fill="#f03800"/></g><g><circle cx="75.013" cy="384.492" fill="#e3e7ea" r="15"/></g><g><path d="m320.028 440.71c4.77-6.266 3.719-15.869-2.83-20.739-6.913-5.635-12.459-13.331-15.507-22.689l-42.231-138.487-10.71-35.312c-.894-2.864-2.737-5.746-5.546-7.697l-70.358-52.016c-16.09-12.072-36.018-16.915-55.809-14.067-19.79 2.848-37.263 13.521-49.237 29.328-2.336 2.991-4.103 6.184-5.973 9.659-16.44 31.092-9.031 70.327 18.807 93.252.93.967 1.961 1.652 2.991 2.336l215.282 159.445c6.83 4.97 15.97 3.436 21.121-3.013z" fill="#fdbf00"/></g><g><g><g><path d="m290.956 414.08c-7.854 2.25-16.076-2.221-18.461-10.046l-77.905-255.787c-5.964-19.073-4.04-39.264 5.4-57.069 9.458-17.768 25.254-30.707 44.289-36.389 19.068-5.95 39.343-4.043 57.069 5.4 17.781 9.463 30.721 25.259 36.416 44.345l25.909 83.998c.956 3.09.883 6.406-.195 9.443l-60.877 171.617c-3.08 8.684-3.513 17.747-1.275 26.204 2.127 7.91-2.518 16.031-10.37 18.284z" fill="#00a66c"/></g></g><g><circle cx="266.211" cy="126.393" fill="#fff5f5" r="15"/></g></g><g><g><g><g><path d="m348.807 459.469-6.59.087c-7.285-.144-14.782-1.575-22.278-4.235-7.193-2.551-13.998-6.24-21.225-11.85-11.645-9.104-20.419-21.745-25.385-36.577-.096-.298-.9-3.07-.978-3.378-3.821-14.334-3.142-29.527 1.976-43.953l90.933-256.35c13.825-38.973 56.785-59.436 95.758-45.611s59.436 56.785 45.611 95.758l-90.933 256.35c-9.935 28.012-36.55 48.009-66.889 49.759z" fill="#4086f4"/></g></g></g></g><path d="m348.807 459.469c30.339-1.75 56.954-21.747 66.89-49.759l90.933-256.35c13.825-38.973-6.638-81.933-45.611-95.758l-141.08 397.719c7.496 2.659 14.993 4.091 22.278 4.234z" fill="#4175df"/><g><circle cx="345.012" cy="384.637" fill="#e3e7ea" r="15"/></g><path d="m359.149 389.652c2.77-7.808-1.315-16.382-9.122-19.152l-10.029 28.274c7.807 2.77 16.382-1.314 19.151-9.122z" fill="#e3e7ea"/><g><circle cx="435.946" cy="128.288" fill="#fff5f5" r="15"/></g><g><path d="m140.119 232.696c3.602-4.77 3.912-11.027.873-15.925-.629-1.814-2.207-3.648-3.986-4.915-4.305-3.118-9.795-3.793-14.391-1.604-2.581.994-4.697 2.472-6.448 4.715-5.254 6.732-3.82 16.154 3.012 21.123 6.55 4.871 15.969 3.438 20.94-3.394z" fill="#fff5f5"/></g><g fill="#e3e7ea"><path d="m140.119 232.696c3.602-4.77 3.912-11.027.873-15.925l-18.377-6.519c-2.581.994-4.697 2.472-6.448 4.715-5.254 6.732-3.82 16.154 3.012 21.123 6.55 4.871 15.969 3.438 20.94-3.394z"/><path d="m450.083 133.302c2.77-7.808-1.315-16.382-9.122-19.152l-10.029 28.274c7.807 2.77 16.381-1.314 19.151-9.122z"/></g></g></svg>
        <h1 class="font-semibold text-2xl ml-2">Brand</h1>
      </div>
      <div class="flex-1 text-sm">
        <ul class="flex flex-row items-center space-x-4">
          <li><Button theme={{:menu}} text_size="text-sm" background="bg-gray-900">Menu 1</Button></li>
          <li><Button theme={{:menu}} text_size="text-sm">Menu 2</Button></li>
          <li><Button theme={{:menu}} text_size="text-sm">Menu 3</Button></li>
        </ul>
      </div>
      <div><input type="search" class="text-white text-xs h-8 mr-4 bg-gray-600 border border-gray-400 px-2" placeholder="Search" /> <Button theme={{:menu}} text_size="text-sm" background="bg-blue-500">Login</Button></div>
    </div>

    <div class="h-16 text-gray-800 flex flex-row bg-white items-center px-10 space-x-4 border-b border-gray-300 shadow">
      <div class="md:hidden">
        <button type="button" class="p-2 bg-indigo-100">M</button>
      </div>
      <div class="flex flex-row items-center justify-center md:justify-left flex-1 md:flex-none">
        <svg id="Capa_1" class="h-10 w-10" enable-background="new 0 0 510.95 510.95" height="512" viewBox="0 0 510.95 510.95" width="512" xmlns="http://www.w3.org/2000/svg"><g><g><path d="m342.528 459.558-267.661-.088c-41.24.012-74.825-33.646-74.867-75.066-.002-19.973 7.813-38.852 22.029-52.989 14.183-14.087 33.007-21.848 53.05-21.873l88.148.074c3.215.006 6.332 1.034 8.918 2.946l146.5 108.418c3.196 2.47 7.112 4.575 11.323 6.068 4.473 1.587 8.803 2.439 12.878 2.517 10.201.207 17.245 10.362 13.822 20.011-2.066 5.825-7.617 9.995-14.14 9.982z" fill="#f03800"/></g><g><circle cx="75.013" cy="384.492" fill="#e3e7ea" r="15"/></g><g><path d="m320.028 440.71c4.77-6.266 3.719-15.869-2.83-20.739-6.913-5.635-12.459-13.331-15.507-22.689l-42.231-138.487-10.71-35.312c-.894-2.864-2.737-5.746-5.546-7.697l-70.358-52.016c-16.09-12.072-36.018-16.915-55.809-14.067-19.79 2.848-37.263 13.521-49.237 29.328-2.336 2.991-4.103 6.184-5.973 9.659-16.44 31.092-9.031 70.327 18.807 93.252.93.967 1.961 1.652 2.991 2.336l215.282 159.445c6.83 4.97 15.97 3.436 21.121-3.013z" fill="#fdbf00"/></g><g><g><g><path d="m290.956 414.08c-7.854 2.25-16.076-2.221-18.461-10.046l-77.905-255.787c-5.964-19.073-4.04-39.264 5.4-57.069 9.458-17.768 25.254-30.707 44.289-36.389 19.068-5.95 39.343-4.043 57.069 5.4 17.781 9.463 30.721 25.259 36.416 44.345l25.909 83.998c.956 3.09.883 6.406-.195 9.443l-60.877 171.617c-3.08 8.684-3.513 17.747-1.275 26.204 2.127 7.91-2.518 16.031-10.37 18.284z" fill="#00a66c"/></g></g><g><circle cx="266.211" cy="126.393" fill="#fff5f5" r="15"/></g></g><g><g><g><g><path d="m348.807 459.469-6.59.087c-7.285-.144-14.782-1.575-22.278-4.235-7.193-2.551-13.998-6.24-21.225-11.85-11.645-9.104-20.419-21.745-25.385-36.577-.096-.298-.9-3.07-.978-3.378-3.821-14.334-3.142-29.527 1.976-43.953l90.933-256.35c13.825-38.973 56.785-59.436 95.758-45.611s59.436 56.785 45.611 95.758l-90.933 256.35c-9.935 28.012-36.55 48.009-66.889 49.759z" fill="#4086f4"/></g></g></g></g><path d="m348.807 459.469c30.339-1.75 56.954-21.747 66.89-49.759l90.933-256.35c13.825-38.973-6.638-81.933-45.611-95.758l-141.08 397.719c7.496 2.659 14.993 4.091 22.278 4.234z" fill="#4175df"/><g><circle cx="345.012" cy="384.637" fill="#e3e7ea" r="15"/></g><path d="m359.149 389.652c2.77-7.808-1.315-16.382-9.122-19.152l-10.029 28.274c7.807 2.77 16.382-1.314 19.151-9.122z" fill="#e3e7ea"/><g><circle cx="435.946" cy="128.288" fill="#fff5f5" r="15"/></g><g><path d="m140.119 232.696c3.602-4.77 3.912-11.027.873-15.925-.629-1.814-2.207-3.648-3.986-4.915-4.305-3.118-9.795-3.793-14.391-1.604-2.581.994-4.697 2.472-6.448 4.715-5.254 6.732-3.82 16.154 3.012 21.123 6.55 4.871 15.969 3.438 20.94-3.394z" fill="#fff5f5"/></g><g fill="#e3e7ea"><path d="m140.119 232.696c3.602-4.77 3.912-11.027.873-15.925l-18.377-6.519c-2.581.994-4.697 2.472-6.448 4.715-5.254 6.732-3.82 16.154 3.012 21.123 6.55 4.871 15.969 3.438 20.94-3.394z"/><path d="m450.083 133.302c2.77-7.808-1.315-16.382-9.122-19.152l-10.029 28.274c7.807 2.77 16.381-1.314 19.151-9.122z"/></g></g></svg>
        <h1 class="font-semibold text-2xl ml-2 hidden md:block">Brand</h1>
      </div>
      <div class="hidden md:block flex-1 text-sm font-semibold">
        <ul class="flex flex-row items-center space-x-8 ml-4">
          <li><a href="#" class="block border-b-2 border-indigo-500 hover:border-indigo-200 pb-4 mt-6 px-2 hover:text-indigo-800">Menu 1</a></li>
          <li><a href="#" class="block border-b-2 border-transparent hover:border-indigo-200 pb-4 mt-6 px-2 text-gray-500 hover:text-indigo-800">Menu 2</a></li>
          <li><a href="#" class="block border-b-2 border-transparent hover:border-indigo-200 pb-4 mt-6 px-2 text-gray-500 hover:text-indigo-800">Menu 3</a></li>
        </ul>
      </div>
      <div><input type="search" class="hidden md:inline-block text-indigo-900 text-xs h-8 mr-4 bg-indigo-50 border border-indigo-400 px-2" placeholder="Search" /> <Button theme={{:menu}} text_size="text-sm" background="bg-indigo-500">Login</Button></div>
    </div>

    <Breadcrumb crumbs={{[%{name: "About", href: "/about"}, %{name: "Team", href: "/about/team"}, %{name: "Marius"}]}} bordered=true margin="mt-3" />

    <div class="my-2">
      <h1 class="text-4xl">Title</h1>
      <span class="text-lg">Subtext here</span>
    </div>


    <div class="my-2 text-gray-400">
      <Icon icon="tick" />
      <Icon icon="tick" theme={{:success}} />
      <Icon icon="cross" />
      <Icon icon="cross" colour="text-red-800" />
      <Icon icon="cross" w="w-12" h="h-12" />
    </div>



    <div class="my-2 text-gray-400">
      <Tabs id="my_tabs">
        <TabItem label="Tab 1" icon="cross">Hello 1</TabItem>
        <TabItem label="Tab 1a23423 4234 234 23" icon="cross">Hello 1</TabItem>
        <TabItem label="Tab 1b" icon="cross">Hello 1</TabItem>
        <TabItem label="Tab 1c" icon="cross">Hello 1</TabItem>
        <TabItem label="Tab 1d" icon="cross">Hello 1</TabItem>
        <TabItem label="Tab 1e" icon="cross">Hello 1</TabItem>
        <TabItem label="Tab 1f" icon="cross">Hello 1</TabItem>
        <TabItem label="Tab 1g" icon="cross">Hello 1</TabItem>
        <TabItem label="Tab 1h" icon="cross">Hello 1</TabItem>
        <TabItem label="Tab 1i" icon="cross">Hello 1</TabItem>
        <TabItem label="Tab 1j" icon="cross">Hello 1</TabItem>
        <TabItem label="Tab 1k" icon="cross">Hello 1</TabItem>

        <TabItem label="Tab 2 dsfds" icon="plus">

        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras nibh metus, pharetra id velit nec, ultrices ornare ipsum. Vestibulum id ultricies diam, luctus accumsan felis. Nulla nec feugiat ipsum. Mauris ultricies consectetur arcu at varius. Pellentesque maximus iaculis metus venenatis tempor. Pellentesque nulla libero, aliquet at magna sit amet, laoreet vestibulum diam. Aenean auctor efficitur est ut rhoncus. Curabitur mollis lorem arcu, a lobortis leo sagittis ut. Donec faucibus diam ut gravida tincidunt. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque aliquam neque eu malesuada condimentum.

Donec fringilla finibus libero sed viverra. Suspendisse potenti. Vestibulum viverra, velit at imperdiet ullamcorper, justo tellus eleifend massa, eu vulputate urna nulla et leo. Nulla sed eros sit amet velit rutrum feugiat. Etiam ut sapien venenatis, ullamcorper turpis ut, tristique nibh. Curabitur a varius enim, id dignissim purus. Sed vulputate, tellus in finibus volutpat, risus lacus rhoncus augue, ac imperdiet justo nibh eget magna. Proin quis elit in sem consequat interdum ut et magna. Nullam dignissim at tellus ac ultrices. Sed sagittis in diam a mattis. Nullam venenatis elit eu feugiat ornare. Nunc in egestas eros.

Etiam quis rutrum mi. Nam molestie nibh augue. Sed convallis libero eget felis placerat sollicitudin. Vestibulum sit amet auctor elit. Proin augue orci, molestie at massa quis, pellentesque suscipit lectus. Maecenas eleifend mi a ipsum viverra suscipit. Sed dictum rhoncus auctor. Ut risus eros, elementum eget nisi a, pulvinar sollicitudin dui. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. In dictum faucibus ante non vestibulum. Integer eu vestibulum odio, a convallis turpis. Curabitur rutrum purus eget scelerisque iaculis.

Nam sit amet arcu sollicitudin, blandit felis posuere, tincidunt magna. In hac habitasse platea dictumst. Donec tincidunt, sapien eu fermentum laoreet, nisl velit commodo dolor, ut tempus orci velit eget ex. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent gravida enim vel tincidunt volutpat. In hac habitasse platea dictumst. Quisque ornare eget arcu vitae pellentesque.

Proin a tortor sed urna accumsan malesuada. Sed eget lectus elementum, aliquam ipsum vitae, venenatis neque. Donec aliquet est ut turpis malesuada fringilla. Pellentesque ultricies auctor laoreet. Nullam in lectus ac risus ullamcorper lobortis eu eu purus. Duis eu odio accumsan, bibendum massa ac, mattis dolor. In hac habitasse platea dictumst. Morbi sollicitudin vel lectus ut sagittis. Maecenas posuere tincidunt aliquam. Morbi feugiat ex vehicula dapibus commodo. Morbi eleifend vehicula nisl. Proin varius commodo ligula, ut pellentesque odio egestas vitae. Etiam tempus tempus nulla, non molestie dolor vehicula nec.


        </TabItem>
        <TabItem label="Tab dis" disabled=true>Disabled tab</TabItem>
        <TabItem label="Tab 3">Hello 3</TabItem>
      </Tabs>
    </div>


    <div class="my-2 text-gray-400">
    <Tabs id="my_tabs_2" location="left">
      <TabItem label="Tab 1" icon="tick">Hello 1</TabItem>
      <TabItem label="Tab 2 sdfsdfsd" icon="plus">

      Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras nibh metus, pharetra id velit nec, ultrices ornare ipsum. Vestibulum id ultricies diam, luctus accumsan felis. Nulla nec feugiat ipsum. Mauris ultricies consectetur arcu at varius. Pellentesque maximus iaculis metus venenatis tempor. Pellentesque nulla libero, aliquet at magna sit amet, laoreet vestibulum diam. Aenean auctor efficitur est ut rhoncus. Curabitur mollis lorem arcu, a lobortis leo sagittis ut. Donec faucibus diam ut gravida tincidunt. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque aliquam neque eu malesuada condimentum.

Donec fringilla finibus libero sed viverra. Suspendisse potenti. Vestibulum viverra, velit at imperdiet ullamcorper, justo tellus eleifend massa, eu vulputate urna nulla et leo. Nulla sed eros sit amet velit rutrum feugiat. Etiam ut sapien venenatis, ullamcorper turpis ut, tristique nibh. Curabitur a varius enim, id dignissim purus. Sed vulputate, tellus in finibus volutpat, risus lacus rhoncus augue, ac imperdiet justo nibh eget magna. Proin quis elit in sem consequat interdum ut et magna. Nullam dignissim at tellus ac ultrices. Sed sagittis in diam a mattis. Nullam venenatis elit eu feugiat ornare. Nunc in egestas eros.

Etiam quis rutrum mi. Nam molestie nibh augue. Sed convallis libero eget felis placerat sollicitudin. Vestibulum sit amet auctor elit. Proin augue orci, molestie at massa quis, pellentesque suscipit lectus. Maecenas eleifend mi a ipsum viverra suscipit. Sed dictum rhoncus auctor. Ut risus eros, elementum eget nisi a, pulvinar sollicitudin dui. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. In dictum faucibus ante non vestibulum. Integer eu vestibulum odio, a convallis turpis. Curabitur rutrum purus eget scelerisque iaculis.

Nam sit amet arcu sollicitudin, blandit felis posuere, tincidunt magna. In hac habitasse platea dictumst. Donec tincidunt, sapien eu fermentum laoreet, nisl velit commodo dolor, ut tempus orci velit eget ex. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent gravida enim vel tincidunt volutpat. In hac habitasse platea dictumst. Quisque ornare eget arcu vitae pellentesque.

Proin a tortor sed urna accumsan malesuada. Sed eget lectus elementum, aliquam ipsum vitae, venenatis neque. Donec aliquet est ut turpis malesuada fringilla. Pellentesque ultricies auctor laoreet. Nullam in lectus ac risus ullamcorper lobortis eu eu purus. Duis eu odio accumsan, bibendum massa ac, mattis dolor. In hac habitasse platea dictumst. Morbi sollicitudin vel lectus ut sagittis. Maecenas posuere tincidunt aliquam. Morbi feugiat ex vehicula dapibus commodo. Morbi eleifend vehicula nisl. Proin varius commodo ligula, ut pellentesque odio egestas vitae. Etiam tempus tempus nulla, non molestie dolor vehicula nec.



      </TabItem>
      <TabItem label="Tab dis" disabled=true>Disabled tab</TabItem>
      <TabItem label="Tab 3" icon="cross">Hello 3</TabItem>
    </Tabs>
  </div>





    <Notification title="No actions">
      Quisque pede tellus, dictum eget, dapibus ac, sodales dictum, lectus.
      Pellentesque mi dui, molestie sit amet, adipiscing id, iaculis quis, arcu.
    </Notification>


    <Notification title="Inline action" action_location={{:inline}} class="mt-12"/>

    <Notification title="Icon added" icon={{:tick}} class="mt-12">
      Quisque pede tellus, dictum eget, dapibus ac, sodales dictum, lectus.
      Pellentesque mi dui, molestie sit amet, adipiscing id, iaculis quis, arcu.
    </Notification>

    <Notification title="Bottom actions" icon={{:tick}} class="mt-12" action_location={{:bottom}}
                  secondary_action={{"Event"}}>
      Quisque pede tellus, dictum eget, dapibus ac, sodales dictum, lectus.
      Pellentesque mi dui, molestie sit amet, adipiscing id, iaculis quis, arcu.
    </Notification>

    <Notification title="Bottom actions, with theme" icon={{:tick}} class="mt-12" action_location={{:bottom}}
        secondary_action={{"Event"}} theme={{:alert}}>
    Quisque pede tellus, dictum eget, dapibus ac, sodales dictum, lectus.
    Pellentesque mi dui, molestie sit amet, adipiscing id, iaculis quis, arcu.
    </Notification>

    <Notification title="Bottom actions, with theme" icon={{:tick}} class="mt-12" action_location={{:bottom}}
        secondary_action={{"Event"}} theme={{:success}}>
    Quisque pede tellus, dictum eget, dapibus ac, sodales dictum, lectus.
    Pellentesque mi dui, molestie sit amet, adipiscing id, iaculis quis, arcu.
    </Notification>

    <Notification title="Bottom actions, with theme" icon={{:tick}} class="mt-12" action_location={{:bottom}}
    secondary_action={{"Event"}} theme={{:warning}}>
Quisque pede tellus, dictum eget, dapibus ac, sodales dictum, lectus.
Pellentesque mi dui, molestie sit amet, adipiscing id, iaculis quis, arcu.
</Notification>

    <Notification title="Action right, single"
                  icon={{:tick}}
                  class="mt-12"
                  action_location={{:right}}>
      Quisque pede tellus, dictum eget, dapibus ac, sodales dictum, lectus.
      Pellentesque mi dui, molestie sit amet, adipiscing id, iaculis quis, arcu.
    </Notification>

    <Notification title="Action right, dual"
                  icon={{:tick}}
                  class="mt-12"
                  action_location={{:right}}
                  secondary_action={{"secondary_action"}}>
      Quisque pede tellus, dictum eget, dapibus ac, sodales dictum, lectus.
      Pellentesque mi dui, molestie sit amet, adipiscing id, iaculis quis, arcu.
    </Notification>

    <Notification title="No slot, title only, action to right" icon={{:tick}} action_location={{:right}} class="mt-12 absolute top-10 right-10" />

    <Notification title="No slot, title only, no action" icon={{:tick}} class="mt-12" />

    <Notification title="No slot, title only, no action" class="mt-12" />



    <Notification title="Discussion archived" icon={{:tick}} class="mt-12" action_location={{:buttom}}>
      Quisque pede tellus, dictum eget, dapibus ac, sodales dictum, lectus.
      Pellentesque mi dui, molestie sit amet, adipiscing id, iaculis quis, arcu.
    </Notification>

    <Grid gap="gap-8">

    <Accordion id="faq_accordion" margin="my-8">
      <AccordionItem title="This is the title">Item 1</AccordionItem>
      <AccordionItem title="Some other item">This is the second item</AccordionItem>
    </Accordion>


    <Accordion id="faq_accordion_2" margin="my-8" theme={{:secondary}}>
      <AccordionItem title="This is the title">Item 1</AccordionItem>
      <AccordionItem title="Some other item">This is the second item</AccordionItem>
    </Accordion>


    <Accordion id="faq_accordion_3" margin="my-8" theme={{:secondary_varient}}>
      <AccordionItem title="This is the title">Item 1</AccordionItem>
      <AccordionItem title="Some other item">This is the second item</AccordionItem>
    </Accordion>


      <Accordion id="faq_accordion_4" margin="my-8" theme={{:neutral}}>
        <AccordionItem title="This is the title">Item 1</AccordionItem>
        <AccordionItem title="Some other item">This is the second item</AccordionItem>
      </Accordion>

      <Accordion id="faq_accordion_5" margin="my-8" theme={{:tertiary}}>
        <AccordionItem title="This is the title">Item 1</AccordionItem>
        <AccordionItem title="Some other item">This is the second item</AccordionItem>
      </Accordion>
    </Grid>












    Column

       Content area

       Aside

    <h1 class="text-xl">Related articles</h1>
    <Grid>
      <div>Article</div>
    </Grid>


    Footer

    <Button theme={{:primary}}>Primary</Button>
    <Button theme={{:secondary}}>Secondary</Button>

    </div>






    """
  end

end
