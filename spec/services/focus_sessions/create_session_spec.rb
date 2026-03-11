# spec/services/focus_sessions/create_session_spec.rb
require "rails_helper"

RSpec.describe FocusSessions::CreateSession do
  describe "#call" do
    it "creates a FocusSession with valid information" do
      user = create(:user) #using our users.rb factory to create a real user
      task = create(:task, user: user) #create a task to attach to user

      expect { # this is our filing cabinet check to see how many sessions have been created
        FocusSessions::CreateSession.new( # this also calls our CreateSession service object with the real data
          user: user,
          task_id: task.id,
          duration_minutes: 25
      ).call
}.to change(FocusSession, :count).by(1)
    end
  end
end