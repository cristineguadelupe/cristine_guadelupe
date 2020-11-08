defmodule CristineGuadelupeWeb.Components.Console do
  use CristineGuadelupeWeb, :live_component

  def render(assigns) do
    ~L"""
    <svg id="Layer_1" data-name="Layer 1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 329.9 602.27">
      <defs>
        <style>
          @font-face {
            font-family: VideoGameFont;
            src: url('/fonts/VideoGameFont.otf');
          }
          .cls-1 {
            fill: #d62d56;
          }

          .cls-2 {
            fill: #f9385d;
          }

          .cls-3 {
            fill: #353152;
          }
        </style>
      </defs>
      <path class="cls-1" d="M295.63,602.27H58.51c-18.93,0-34.27-18.14-34.27-40.51V40.52C24.24,18.14,39.58,0,58.51,
      0H295.63c18.93,0,34.27,18.14,34.27,40.52V561.76a44.63,44.63,0,0,1-9.08,27.47C314.56,597.25,305.59,602.27,295.63,602.27Z"/>
      <path class="cls-2" d="M271.39,602.27H34.27C15.34,602.27,0,584.13,0,561.76V40.52C0,18.14,15.34,0,34.27,
      0H271.39c18.93,0,34.27,18.14,34.27,40.52V561.76a44.63,44.63,0,0,1-9.08,27.47C290.32,597.25,281.35,602.27,271.39,602.27Z"/>
      <rect class="cls-3" x="60" y="40" width="200" height="400"/>
      <polygon class="cls-3" points="98.18 507.3 98.18 475.81 68.54 475.81 68.54 507.3 37.05 507.3 37.05 536.94 68.54 536.94
      68.54 568.44 98.18 568.44 98.18 536.94 129.67 536.94 129.67 507.3 98.18 507.3"/>
      <circle class="cls-3" cx="251.01" cy="502.67" r="17.6"/>
      <circle class="cls-3" cx="215.82" cy="541.57" r="17.6"/>
    </svg>
    """
  end

end
