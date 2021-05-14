defmodule  LiveViewStudioWeb.SearchLive do
use LiveViewStudioWeb, :live_view

alias LiveViewStudioWeb.Stores


def mount(_params, _session, socket) do
socket =
assign(
  socket,
  zip:"",
  stores Stores.list_stores()
)
{:ok, socket}
end

def render(assigns) do
  ~L"""
  <h1>Sales Dashboard</h1>
  <div id="dashboard">
    <div class="stats">
      <div class="stat">
        <span class="value">
          <%= @new_orders %>
        </span>
        <span class="name">
          New Orders
        </span>
      </div>
      <div class="stat">
        <span class="value">
          $<%= @sales_amount %>
        </span>
        <span class="name">
          Sales Amount
        </span>
      </div>
      <div class="stat">
        <span class="value">
          <%= @satisfaction %>%
        </span>
        <span class="name">
          Satisfaction
        </span>
      </div>
    </div>

    <button phx-click="refresh">
      <img src="images/refresh.svg">
      Refresh
    </button>
  </div>
  """
end




end
