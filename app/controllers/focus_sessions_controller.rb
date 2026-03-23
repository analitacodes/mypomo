class FocusSessionsController < ApplicationController
  def create
    session = FocusSessions::CreateSession.new(
      user: Current.session.user,
      task_id: params[:task_id],
      duration_minutes: params[:duration_minutes]
    ).call

    # render JSON back
    render json: { status: "ok", id: session.id }, status: :created
  end
end
