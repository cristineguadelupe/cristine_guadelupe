defmodule CristineGuadelupeWeb.MasterKey.Won do
  use CristineGuadelupeWeb, :live_view
  alias CristineGuadelupeWeb.Components.{Console}

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  defp render_content(assigns) do
    ~L"""
    <%= live_component(@socket, Console, assigns: assigns) %>
    <%= render_won(assigns) %>
    <%= render_play_again(assigns) %>
    """
  end

  defp render_won(assigns) do
    ~L"""
    <svg x="60" y="40" width="200" height="400"
      xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
      <image href="/images/masterkey_won.png" height="400" width="200"/>
    </svg>
    """
  end

  defp render_play_again(assigns) do
    ~L"""
    <foreignObject xmlns="http://www.w3.org/2000/svg" x="85" y="325" width="150" height="40">
        <body xmlns="http://www.w3.org/1999/xhtml" style="margin:0px; height:100%;">
            <button phx-click="masterkey" class="console-menu" type="button" style="width:100%; height:100%;">
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

  defp masterkey(socket) do
    socket
    |> push_redirect(to: "/games/masterkey")
  end
  defp home(socket) do
    socket
    |> push_redirect(to: "/")
  end

  def handle_event("masterkey", _, socket) do
    {:noreply, socket |> masterkey}
  end
  def handle_event("home", _, socket) do
    {:noreply, socket |> home}
  end

end
