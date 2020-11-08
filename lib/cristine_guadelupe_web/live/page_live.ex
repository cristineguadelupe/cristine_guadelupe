defmodule CristineGuadelupeWeb.PageLive do
  use CristineGuadelupeWeb, :live_view
  alias CristineGuadelupeWeb.Components.{Console, Menu}

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
    <%= live_component(@socket, Menu, label: "tetris", action: "tetris", position: "150") %>
    <%= live_component(@socket, Menu, label: "about me", action: "about", position: "325") %>
    """
  end

  defp tetris(socket) do
    socket
    |> push_redirect(to: "/games/tetris")
  end
  defp about(socket)do
    socket
    |> push_redirect(to: "/aboutme")
  end

  def handle_event("tetris", _, socket) do
    {:noreply, socket |> tetris}
  end
  def handle_event("about", _, socket) do
    {:noreply, socket |> about}
  end

end
