defmodule CristineGuadelupeWeb.Tetris.GameOver do
  use CristineGuadelupeWeb, :live_view
  alias CristineGuadelupeWeb.Components.{Console, GameOver}

  def mount(params, _session, socket) do
    {:ok, assign(socket, score: params["score"])}
  end

  defp render_content(assigns) do
    ~L"""
    <%= live_component(@socket, Console, assigns: assigns) %>
    <%= live_component(@socket, GameOver, assigns: assigns) %>
    <%= render_score(assigns) %>
    <%= render_play_again(assigns) %>
    """
  end

  defp render_score(assigns) do
    ~L"""
    <text x="50%" y="75" dominant-baseline="middle" text-anchor="middle"
      font-family="VideoGameFont" font-size="20" fill="AliceBlue" opacity="0.7">
      your score <%= @score %>
    </text>
    """
  end

  defp render_play_again(assigns) do
    ~L"""
    <foreignObject xmlns="http://www.w3.org/2000/svg" x="85" y="300" width="150" height="40">
        <body xmlns="http://www.w3.org/1999/xhtml" style="margin:0px; height:100%;">
            <button phx-click="tetris" class="console-menu" type="button" style="width:100%; height:100%;">
            play again!
            </button>
        </body>
    </foreignObject>
    <foreignObject xmlns="http://www.w3.org/2000/svg" x="85" y="375" width="150" height="40">
        <body xmlns="http://www.w3.org/1999/xhtml" style="margin:0px; height:100%;">
            <button phx-click="home" class="console-menu" type="button" style="width:100%; height:100%;">
            main menu
            </button>
        </body>
    </foreignObject>
    """
  end

  defp tetris(socket) do
    socket
    |> push_redirect(to: "/games/tetris")
  end
  defp home(socket) do
    socket
    |> push_redirect(to: "/")
  end

  def handle_event("tetris", _, socket) do
    {:noreply, socket |> tetris}
  end
  def handle_event("home", _, socket) do
    {:noreply, socket |> home}
  end

end
