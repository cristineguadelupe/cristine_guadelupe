defmodule CristineGuadelupeWeb.PageLive do
  use CristineGuadelupeWeb, :live_view
  alias CristineGuadelupeWeb.Components.Console

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  defp render_content(assigns) do
    ~L"""
      <%= live_component(@socket, Console, assigns: assigns) %>
      <%= render_title(assigns) %>
      <%= render_menu(assigns) %>
    """
  end

  defp render_title(assigns) do
    ~L"""
    <text x="50%" y="75" dominant-baseline="middle" text-anchor="middle"
      font-family="VideoGameFont" font-size="20" fill="AliceBlue" opacity="0.7">
      welcome
    </text>
    <text x="50%" y="100" dominant-baseline="middle" text-anchor="middle"
      font-family="Verdana" font-size="20" fill="AliceBlue" opacity="0.7">
      - - - - - - -
    </text>
    """
  end

  defp render_menu(assigns) do
    ~L"""
    <foreignObject xmlns="http://www.w3.org/2000/svg" x="85" y="150" width="150" height="40">
        <body xmlns="http://www.w3.org/1999/xhtml" style="margin:0px; height:100%;">
            <button phx-click="tetris" class="console-menu" type="button" style="width:100%; height:100%;">
              tetris
            </button>
        </body>
    </foreignObject>
    <foreignObject xmlns="http://www.w3.org/2000/svg" x="85" y="200" width="150" height="40">
        <body xmlns="http://www.w3.org/1999/xhtml" style="margin:0px; height:100%;">
            <button class="console-menu" type="button" style="width:100%; height:100%;">
              snake
            </button>
        </body>
    </foreignObject>
    <foreignObject xmlns="http://www.w3.org/2000/svg" x="85" y="250" width="150" height="40">
        <body xmlns="http://www.w3.org/1999/xhtml" style="margin:0px; height:100%;">
            <button class="console-menu" type="button" style="width:100%; height:100%;">
              one more
            </button>
        </body>
    </foreignObject>
    <foreignObject xmlns="http://www.w3.org/2000/svg" x="85" y="325" width="150" height="40">
        <body xmlns="http://www.w3.org/1999/xhtml" style="margin:0px; height:100%;">
            <button phx-click="about" class="console-menu" type="button" style="width:100%; height:100%;">
              about me
            </button>
        </body>
    </foreignObject>
    """
  end

  defp play(socket) do
    socket
    |> push_redirect(to: "/games/tetris")
  end
  defp about(socket)do
    socket
    |> push_redirect(to: "/aboutme")
  end

  def handle_event("play", _, socket) do
    {:noreply, socket |> play}
  end
  def handle_event("about", _, socket) do
    {:noreply, socket |> about}
  end

end
