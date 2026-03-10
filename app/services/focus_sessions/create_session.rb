class FocusSessions::CreateSession
  def initialize(user:, task_id:, duration_minutes: 25)
    @user = user
    @task_id = task_id
    @duration_minutes = duration_minutes
  end
  
  def call 
    FocusSession.create!(
      user: @user,
      task_id: @task_id,
      duration_minutes: @duration_minutes,
      completed_at: Time.current
    )
  end
end
  