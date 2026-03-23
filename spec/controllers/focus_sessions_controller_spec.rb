require "rails_helper"

RSpec.describe FocusSessionsController, type: :request do
  describe "POST /focus_sessions" do
    let(:user) { create(:user) } # using our users.rb factory to create a real user
    let(:task) { create(:task, user: user) } # create a task to attach to user

    before do
      post "/session", params: {
      email_address: user.email_address,
      password: "password123"
    }
    end

    it "returns 201 when all information is valid" do
     post "/focus_sessions", params: {
      task_id: task.id,
      duration_minutes: 25 }
      expect(response.status).to eq(201)
    end

    it "validates FocusSession has been created in the database" do
    expect {
      post "/focus_sessions", params: {
      task_id: task.id,
      duration_minutes: 25
      }
    }.to change(FocusSession, :count).by(1)
    end

    it "confirms JSON is returned" do
      post "/focus_sessions", params: {
        task_id: task.id,
        duration_minutes: 25
      }

      json = JSON.parse(response.body)

      expect(json["status"]).to eq("ok")
      expect(json["id"]).to be_present
    end

    it "returns error for unauthenticated user" do
      delete "/session"

      post "/focus_sessions", params: {
        task_id: task.id,
        duration_minutes: 25
      }

      expect(response.status).to eq(302)
    end

    it "returns error when no task_id is present" do
      post "/focus_sessions", params: {
        task_id: nil,
        duration_minutes: 25
      }

      expect(response.status).to eq(422)
    end
  end
end
