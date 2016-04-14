describe "train", type: :feature do
  describe "Card" do
      let!(:user) { FactoryGirl.create(:user) }
        it "When user login successful" do
          visit login_path
          fill_in("Email", with: "testing123@gmail.com")
          fill_in("Password", with: "MyString")
          click_button("Login")
          expect(page). to have_content "Login successful"
        end
  end
end
