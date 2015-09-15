class DashboardController < ApplicationController
  def index
    @presenter = PresentDashboard.new.present
  end
end
