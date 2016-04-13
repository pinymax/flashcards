require "rails_helper.rb"

describe "train", type: :feature do
  describe "Card" do
    let!(:card) { FactoryGirl.create(:card) }
    let!(:user) { FactoryGirl.create(:user) }
    before do
      card.update(review_date:  Date.today, user_id: user.id)
    end

    it "When user input right translate" do
      visit login_path
      fill_in("Email", with: "testing123@gmail.com")
      fill_in("Password", with: "MyString")
      click_button("Login")
      visit root_path
      fill_in("translate", with: "Дом")
      click_button("Отправить")
      expect(page).to have_content "В точку!"
    end

    it "When user input wrong translate" do
      visit login_path
      fill_in("Email", with: "testing123@gmail.com")
      fill_in("Password", with: "MyString")
      click_button("Login")
      visit root_path
      fill_in("translate", with: "asSds")
      click_button("Отправить")
      expect(page).to have_content "Неверный перевод"
    end
  end
end
