class DashboardController < ApplicationController
  def home
    @list=ReportDashboard.select( 'casename')#.where(id: 10)
    @list_count=@list.count
  end
end

