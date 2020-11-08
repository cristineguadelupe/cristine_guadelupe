defmodule CristineGuadelupeWeb.Tetris.Playing do
  use CristineGuadelupeWeb, :live_view
  alias CristineGuadelupe.Tetris
  alias CristineGuadelupeWeb.Components.{Console}

  @rotate_keys ["ArrowUp", " "]

  def mount(_params, _session, socket) do
    if connected?(socket) do
      :timer.send_interval(:timer.seconds(60), :inc_speed)
      :timer.send_interval(500, :speed_1)
      :timer.send_interval(400, :speed_2)
      :timer.send_interval(300, :speed_3)
      :timer.send_interval(200, :speed_4)
      :timer.send_interval(100, :speed_5)
      :timer.send_interval(50, :speed_6)
    end
    {:ok, new_game(socket)}
  end

  defp new_game(socket) do
    assign(socket, game: Tetris.new)
  end

  defp right(%{assigns: %{game: game}} = socket) do
    assign(socket, game: Tetris.right(game))
  end
  defp left(%{assigns: %{game: game}} = socket) do
    assign(socket, game: Tetris.left(game))
  end
  defp rotate(%{assigns: %{game: game}} = socket) do
    assign(socket, game: Tetris.rotate(game))
  end

  defp down(%{assigns: %{game: game}} = socket) do
    assign(socket, game: Tetris.down(game))
  end
  defp inc_speed(%{assigns: %{game: game}} = socket) do
    assign(socket, game: Tetris.inc_speed(game))
  end

  defp maybe_end_game(%{assigns: %{game: %{game_over: true}}} = socket) do
    socket
    |> push_redirect(to: "/games/tetris/gameover?score=#{socket.assigns.game.score}")
  end
  defp maybe_end_game(socket), do: socket

  defp render_board(assigns) do
    ~L"""
    <%= live_component(@socket, Console, assigns: assigns) %>
    <%= render_score(assigns) %>
    <%= render_next(assigns) %>
    <%= render_points(assigns) %>
    <%= render_controls(assigns) %>
    <rect class="cls-2" x="55" width="210" height="40"/>
    """
  end

  defp render_controls(assigns) do
    ~L"""
    <foreignObject xmlns="http://www.w3.org/2000/svg" x="68.54" y="475.81" width="29.64" height="31.49">
        <body xmlns="http://www.w3.org/1999/xhtml" style="margin:0px; height:100%;">
            <button phx-click="rotate" class="console-control" type="button" style="width:100%; height:100%;">
            </button>
        </body>
    </foreignObject>
    <foreignObject xmlns="http://www.w3.org/2000/svg" x="37.05" y="507.3" width="31.49" height="29.64">
        <body xmlns="http://www.w3.org/1999/xhtml" style="margin:0px; height:100%;">
            <button phx-click="left" class="console-control" type="button" style="width:100%; height:100%;">
            </button>
        </body>
    </foreignObject>
    <foreignObject xmlns="http://www.w3.org/2000/svg" x="98.18" y="507.3" width="31.49" height="29.64">
        <body xmlns="http://www.w3.org/1999/xhtml" style="margin:0px; height:100%;">
            <button phx-click="right" class="console-control" type="button" style="width:100%; height:100%;">
            </button>
        </body>
    </foreignObject>
    <foreignObject xmlns="http://www.w3.org/2000/svg" x="68.54" y="536.94" width="29.64" height="31.49">
        <body xmlns="http://www.w3.org/1999/xhtml" style="margin:0px; height:100%;">
            <button phx-click="down" class="console-control" type="button" style="width:100%; height:100%;">
            </button>
        </body>
    </foreignObject>
    """
  end

  defp render_score(assigns) do
    ~L"""
    <text x="70" y="65" font-family="VideoGameFont" font-size="20" fill="AliceBlue" opacity="0.7">
      <%= @game.score %>
    </text>
    """
  end

  defp render_points(assigns) do
    ~L"""
    <svg width="260" height="440">
    <%= for {x, y, shape} <- @game.points ++ Tetris.junkyard_points(@game) do %>
      <rect
        width="20" height="20" stroke="white" stroke-opacity="0.25"
        x="<%= ((x-1) * 20) + 60 %>" y="<%= ((y-1) * 20) + 40 %>"
        style="fill:<%= color(shape)%>" />
    <% end %>
    </svg>
    """
  end

  def render_next(assigns) do
    ~L"""
    <svg  x="215" y="36">
      <%= for {x, y, shape} <- @game.next_points do %>
        <rect
        width="10" height="10" stroke="white" stroke-opacity="0.25"
        x="<%= ((x-3) * 10) %>" y="<%= ((y+4) * 10) %>"
        style="fill:<%= color(shape)%>" />
      <% end %>
      </svg>
    """
  end

  defp color(:i), do: "Orange"
  defp color(:l), do: "DodgerBlue"
  defp color(:j), do: "MediumVioletRed"
  defp color(:o), do: "Orchid"
  defp color(:s), do: "PaleVioletRed"
  defp color(:t), do: "BlueViolet"
  defp color(:z), do: "#02CBAE"

  def handle_info(:inc_speed, %{assigns: %{game: %{speed: speed}}} = socket) when speed <= 5 do
    {:noreply, socket |> inc_speed}
  end

  def handle_info(:speed_1, %{assigns: %{game: %{speed: 1}}} = socket) do
    {:noreply, socket |> down |> maybe_end_game}
  end
  def handle_info(:speed_2, %{assigns: %{game: %{speed: 2}}} = socket) do
    {:noreply, socket |> down |> maybe_end_game}
  end
  def handle_info(:speed_3, %{assigns: %{game: %{speed: 3}}} = socket) do
    {:noreply, socket |> down |> maybe_end_game}
  end
  def handle_info(:speed_4, %{assigns: %{game: %{speed: 4}}} = socket) do
    {:noreply, socket |> down |> maybe_end_game}
  end
  def handle_info(:speed_5, %{assigns: %{game: %{speed: 5}}} = socket) do
    {:noreply, socket |> down |> maybe_end_game}
  end
  def handle_info(:speed_6, %{assigns: %{game: %{speed: 6}}} = socket) do
    {:noreply, socket |> down |> maybe_end_game}
  end
  def handle_info(_, socket) do
    {:noreply, socket}
  end

  def handle_event("keystroke", %{"key" => key}, socket) when key in @rotate_keys do
    {:noreply, socket |> rotate}
  end
  def handle_event("keystroke", %{"key" => "ArrowRight"}, socket) do
    {:noreply, socket |> right}
  end
  def handle_event("keystroke", %{"key" => "ArrowLeft"}, socket) do
    {:noreply, socket |> left}
  end
  def handle_event("keystroke", %{"key" => "ArrowDown"}, socket) do
    {:noreply, socket |> down}
  end
  def handle_event("keystroke", %{"key" => _key}, socket) do
    {:noreply, socket}
  end

  def handle_event("down", _, socket) do
    {:noreply, socket |> down}
  end
  def handle_event("left", _, socket) do
    {:noreply, socket |> left}
  end
  def handle_event("right", _, socket) do
    {:noreply, socket |> right}
  end
  def handle_event("rotate", _, socket) do
    {:noreply, socket |> rotate}
  end

end
