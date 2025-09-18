class DashboardController < ApplicationController
  # guests can see the page; saving comes later
  allow_unauthenticated_access

  def show
  end
end
