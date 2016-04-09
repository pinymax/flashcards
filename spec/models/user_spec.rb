require 'rails_helper'
  describe User do
    it "Successfully creates user in DB" do
      user = User.new(email: "mgbtua@gmail.com", password: "123")
      expect(user.new_record?).to be true
    end
  end
