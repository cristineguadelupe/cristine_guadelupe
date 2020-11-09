defmodule CristineGuadelupeWeb.AboutMeLive do
  use CristineGuadelupeWeb, :live_view

  alias CristineGuadelupeWeb.Components.{Console, Button, Title}

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  defp render_content(assigns) do
    ~L"""
      <%= live_component(@socket, Console, assigns: assigns) %>
      <%= render_illustration(assigns) %>
      <%= render_menu(assigns) %>
      <%= render_title(assigns) %>
    """
  end

  defp render_title(assigns) do
    ~L"""
    <%= live_component(@socket, Title, title: "cristine guadelupe") %>
    """
  end

  defp render_menu(assigns) do
    ~L"""
    <%= live_component(@socket, Button, label: "github", action: "github", position: "200") %>
    <%= live_component(@socket, Button, label: "linkedin", action: "linkedin", position: "250") %>
    <%= live_component(@socket, Button, label: "home", action: "home", position: "300") %>
    """
  end

  defp render_illustration(assigns) do
    ~L"""
    <svg x="0" y="300" width="200" height="200"
      xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
      <image href="images/purple.svg" height="200" width="200"/>
    </svg>
    """
  end

  defp home(socket) do
    socket
    |> push_redirect(to: "/")
  end
  defp github(socket) do
    socket
    |> redirect(external: "https://github.com/cristineguadelupe")
  end
  defp likedin(socket) do
    socket
    |> redirect(external: "https://www.linkedin.com/in/cristineguadelupe/")
  end

  def handle_event("home", _, socket) do
    {:noreply, socket |> home}
  end
  def handle_event("github", _, socket) do
    {:noreply, socket |> github}
  end
  def handle_event("linkedin", _, socket) do
    {:noreply, socket |> likedin}
  end

end
