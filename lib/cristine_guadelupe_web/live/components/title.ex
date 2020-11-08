defmodule CristineGuadelupeWeb.Components.Title do
  use CristineGuadelupeWeb, :live_component

  def render(assigns) do
    ~L"""
    <text x="50%" y="75" dominant-baseline="middle" text-anchor="middle"
      font-family="VideoGameFont" font-size="20" fill="AliceBlue" opacity="0.7">
      <%= @title %>
    </text>
    <text x="50%" y="100" dominant-baseline="middle" text-anchor="middle"
      font-family="Verdana" font-size="20" fill="AliceBlue" opacity="0.7">
      - - - - - - -
    </text>
    """
  end
end
