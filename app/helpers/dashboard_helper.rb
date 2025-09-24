module DashboardHelper
  def default_timer_minutes = 25
  def mmss_for(minutes) = format("%02d:%02d", minutes.to_i, 0)
end
