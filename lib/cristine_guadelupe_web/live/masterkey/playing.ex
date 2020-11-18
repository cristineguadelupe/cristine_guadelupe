defmodule CristineGuadelupeWeb.MasterKey.Playing do
  use CristineGuadelupeWeb, :live_view
  alias CristineGuadelupe.MasterKey
  alias CristineGuadelupeWeb.MasterKey.GuessFormData
  alias CristineGuadelupeWeb.Components.{Console}

  def mount(params, _session, socket) do
    {:ok, build(socket, params)}
  end

  def build(socket, params) do
    socket
    |> board(params)
    |> changeset(%{})
    |> game
    |> tries(10)
  end

  defp board(socket, %{answer: _answer} = answer) do
    assign(socket, board: MasterKey.new_board(answer))
  end
  defp board(socket, _) do
    assign(socket, board: MasterKey.new_board())
  end

  defp changeset(socket, params) do
    assign(socket, changeset: GuessFormData.changeset(params))
  end

  defp game(socket) do
    assign(socket, game: MasterKey.to_map(socket.assigns.board))
  end

  defp tries(%{assigns: %{tries: tries}} = socket) do
    assign(socket, tries: tries - 1)
  end
  defp tries(socket, tries) do
    assign(socket, tries: tries)
  end

  defp maybe_end_game(%{assigns: %{game: %{status: :lost}}} = socket) do
    socket
    |> push_redirect(to: "/games/masterkey/gameover")
  end
  defp maybe_end_game(%{assigns: %{game: %{status: :won}}} = socket) do
    socket
    |> push_redirect(to: "/games/masterkey/won?key=#{socket.assigns.board.answer |> Enum.join()}")
  end
  defp maybe_end_game(socket), do: socket

  defp guess(socket, guess) do
    socket
    |> assign(board: MasterKey.guess(socket.assigns.board, guess))
    |> game
    |> tries
    |> changeset(%{})
    |> maybe_end_game()
  end

  def render_board(assigns) do
    ~L"""
    <%= live_component(@socket, Console, assigns: assigns) %>
    <%= render_rows(assigns) %>
    <%= render_guess_form(assigns) %>
    """
  end

  def render_rows(assigns) do
    ~L"""
    <foreignObject xmlns="http://www.w3.org/2000/svg" x="65" y="50" width="200" height="350">
      <%= for row <- @game.rows do %>
      <div class="flex-container-row">
        <%= for guess <- row.guess do %>
          <div style="background-color: <%= "#{bg_color(guess)}" %> "> <%= guess %> </div>
        <% end %>
        <span class="pipe-divider"> |> </span>
        <%= for i <- (0..row.score.reds), i > 0 do %>
        <div class="heart">
          <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
            <path fill="red" d="M10 3.22l-.61-.6a5.5 5.5 0 0 0-7.78 7.77L10 18.78l8.39-8.4a5.5 5.5 0 0 0-7.78-7.77l-.61.61z"/>
          </svg>
        </div>
        <% end %>
        <%= for i <- (0..row.score.whites), i > 0 do %>
        <div class="heart">
          <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
            <path fill="#F8F8FF" d="M10 3.22l-.61-.6a5.5 5.5 0 0 0-7.78 7.77L10 18.78l8.39-8.4a5.5 5.5 0 0 0-7.78-7.77l-.61.61z"/>
          </svg>
        </div>
        <% end %>
      </div>
      <% end %>
    </foreignObject>
    """
  end

  defp render_guess_form(assigns) do
    ~L"""
    <foreignObject xmlns="http://www.w3.org/2000/svg" x="60" y="400" width="200" height="100">
      <%= form_for @changeset, "#", [as: :guess, phx_change: :validate, phx_submit: :guess], fn f -> %>
        <div class="flex-container-guess">
          <div><%= text_input f, :guess, autofocus: "true"%></div>
          <div><%= submit "guess!", class: if !@changeset.valid?, do: "invalid-guess" %></div>
          <div id="tries" style="background-color: <%= "#{color(@tries)}" %> ">
            <span id="tries"> <%= @tries %> </span>
          </div>
        </div>
        <div id="invalid-guess"> <%= error_tag f, :guess %> <div>
      <% end %>
    </foreignObject>
    """
  end

  def handle_event("validate", %{"guess" => params}, socket) do
    {:noreply, changeset(socket, params)}
  end

  def handle_event("guess", _params, %{assigns: %{changeset: %{valid?: false}}} = socket) do
    {:noreply, socket}
  end
  def handle_event("guess", %{"guess" => %{"guess" => params}}, socket) do
    {:noreply, guess(socket, params)}
  end

  defp color(tries) when tries < 3, do: "rgb(229, 62, 62)"
  defp color(tries) when tries < 6, do: "rgb(236, 201, 75)"
  defp color(tries) when tries > 5, do: "rgb(56, 161, 105)"

  defp bg_color(1), do: "Orange"
  defp bg_color(2), do: "DodgerBlue"
  defp bg_color(3), do: "DeepPink"
  defp bg_color(4), do: "Orchid"
  defp bg_color(5), do: "Aquamarine"
  defp bg_color(6), do: "BlueViolet"
  defp bg_color(7), do: "Crimson"
  defp bg_color(8), do: "Silver"

end
