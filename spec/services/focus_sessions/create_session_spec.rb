require "rails_helper"

RSpec.describe FocusSessions::CreateSession do
  describe "#call" do
    let(:user) { create(:user) } # using our users.rb factory to create a real user
    let(:task) { create(:task, user: user) } # create a task to attach to user

    it "creates a FocusSession with valid information" do
      expect { # this is our filing cabinet check to see how many sessions have been created
        FocusSessions::CreateSession.new( # this also calls our CreateSession service object with the real data
          user: user,
          task_id: task.id,
          duration_minutes: 25
      ).call
}.to change(FocusSession, :count).by(1)
    end

    it "saves the correct duration_minutes" do
      FocusSessions::CreateSession.new(
        user: user,
        task_id: task.id,
        duration_minutes: 25
      ).call

      expect(FocusSession.last.duration_minutes).to eq(25)
    end

    it "verifies if user is present" do
      expect {
        FocusSessions::CreateSession.new(
          user: nil,
          task_id: task.id,
          duration_minutes: 25
        ).call
      }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it "verifies if task_id is present" do
      expect {
        FocusSessions::CreateSession.new(
          user: user,
          task_id: nil,
          duration_minutes: 25
        ).call
     }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it "verifies that a session is greater than 0" do
      expect {
        FocusSessions::CreateSession.new(
          user: user,
          task_id: task.id,
          duration_minutes: 0
        ).call
      }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
