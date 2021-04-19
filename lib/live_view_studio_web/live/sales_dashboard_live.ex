defmodule LiveViewStudioWeb.LicenseLive do
  use LiveViewStudioWeb, :live_view

  def mount(_params, _session, socket) do
    socket = assign(socket, seats: 3, amount: Licenses.calculate(3))
    {:ok, socket}
  end

  def render(assigns) do
    ~L"""
    <h1>Team License</h1>
    <div id="license">
      <div class="card">
      <div class="content">
      <div class="seats">
        <img src="images/license.svg">
    <span>
    Your license is currenlty for
    <strong><%= @seats %></strong> seats.
    </span>
    </div>
    <form phx-change="update">
    <input type="range" min="1" max="10"
    name="seats" value = <%= @seats %>/>
    </form>
    <div class="amount">
    <%= number_to_currency(@amount) %>
    </div>
    </div>
    </div>
    </div>
    """
  end


end
