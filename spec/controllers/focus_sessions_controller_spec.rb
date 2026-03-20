require "rails_helper"

RSpec.describe FocusSessionsController, type: :request do
  describe "POST /focus_sessions" do
    let(:user) { create(:user) } #using our users.rb factory to create a real user
    let(:task) { create(:task, user: user) } #create a task to attach to user
    
    before do
      post "/session", params: {
      email_address: user.email_address,
      password: "password123"
    }
    end

    it "returns 201 when all information is valid" do
     post "/focus_sessions", params: {
      task_id: task.id,
      duration_minutes: 25}
      expect(response.status).to eq(201)
    end
  end
end