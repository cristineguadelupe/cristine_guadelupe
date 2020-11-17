defmodule CristineGuadelupeWeb.MasterKey.Playing do
  use CristineGuadelupeWeb, :live_view
  alias CristineGuadelupeWeb.Components.{Console}

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def render_board(assigns) do
    ~L"""
    <%= live_component(@socket, Console, assigns: assigns) %>
    """
  end

end
