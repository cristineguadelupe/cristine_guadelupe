defmodule CristineGuadelupeWeb.HomeLive do
  use CristineGuadelupeWeb, :live_view
  alias CristineGuadelupeWeb.Components.{Console, Button, Title}

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
    <%= live_component(@socket, Title, title: "welcome") %>
    """
  end

  defp render_menu(assigns) do
    ~L"""
    <%= live_component(@socket, Button, label: "tetris", action: "tetris", position: "150") %>
    <%= live_component(@socket, Button, label: "soon", action: "", position: "200") %>
    <%= live_component(@socket, Button, label: "soon", action: "", position: "250") %>
    <%= live_component(@socket, Button, label: "about me", action: "about", position: "325") %>
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
