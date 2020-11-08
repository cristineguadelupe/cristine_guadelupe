defmodule CristineGuadelupeWeb.Components.Menu do
  use CristineGuadelupeWeb, :live_component

  def render(assigns) do
    ~L"""
    <foreignObject xmlns="http://www.w3.org/2000/svg" x="85" y="<%= @position %>" width="150" height="40">
        <body xmlns="http://www.w3.org/1999/xhtml" style="margin:0px; height:100%;">
            <button phx-click="<%= @action %>" phx-target=".phx-hero" class="console-menu"
                    type="button" style="width:100%; height:100%;">
              <%= @label %>
            </button>
        </body>
    </foreignObject>
    """
  end
end
