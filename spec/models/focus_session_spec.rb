# spec/models/focus_session_spec.rb
require "rails_helper"

RSpec.describe FocusSession, type: :model do
  describe "validations" do
    it "is valid with a duration" do
      session = build(:focus_session)        # uses factory, includes a user
      expect(session).to be_valid
    end

    it "is invalid without a duration" do
      session = build(:focus_session, duration_minutes: nil)
      expect(session).not_to be_valid
    end

    it "is invalid with a duration of 0" do
      session = build(:focus_session, duration_minutes: 0)
      expect(session).not_to be_valid
    end
  end
end