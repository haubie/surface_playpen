defmodule SurfacePlaypenWeb.TriviaCard do
  use Surface.LiveComponent

  alias SurfaceTailwind.Button

  data answered, :boolean, default: false
  data trivia_value, :string
  data trivia_card, :any

  def mount(socket) do
    card = random_card()
    {:ok,
      socket
      |> assign(trivia_value: card.question)
      |> assign(trivia_card: card)}
  end

  def render(assigns) do
    ~H"""
    <div>
      <div class="card mb-8">
        <h3>
        {{ @trivia_value }}
        </h3>
      </div>

      <div class="mx-12">


      <Button>Default style from theme</Button>

      <Button background="bg-green-600 hover:bg-green-900">Backround overridden</Button>

      <Button theme="secondary">Secondary pallete</Button>

      </div>

      <p class="mt-12">aaa</p>


      <Button click="answer">Answer</Button>
      <Button :if={{ @answered }} click="new">Another 1</Button>




    </div>
    """
  end

  def handle_event("answer", _value, socket) do
    card = socket.assigns.trivia_card
    {:noreply,
      socket
      |> assign(trivia_value: card.answer)
      |> assign(answered: true)}
  end

  def handle_event("new", _value, socket) do
    card = random_card()
      {:noreply,
        socket
        |> assign(answered: false)
        |> assign(trivia_value: card.question)
        |> assign(trivia_card: card)}
  end

  defp random_card do
    [
      %{question: "Question 1", answer: "Answer 1"},
      %{question: "Question 2", answer: "Answer 2"},
      %{question: "Question 3", answer: "Answer 3"},
      %{question: "Question 4", answer: "Answer 4"},
      %{question: "Question 5", answer: "Answer 5"}
    ]
    |> Enum.random()
  end

end
