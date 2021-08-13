defmodule SurfaceTailwind.Accordion.AccordionItem do
  use Surface.Component, slot: "item"

  prop expanded, :boolean, default: false
  prop title, :string
end
