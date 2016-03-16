require "rails_helper.rb"

describe "train", type: :feature do
  describe "Card" do
    let!(:card) { FactoryGirl.create(:card) }
    before do
      card.update(review_date:  Date.today)
    end

    it "When user input right translate" do
      visit root_path
      puts page.body
      fill_in("translate", with: "Дом")
      click_button("Отправить")
      expect(page).to have_content "В точку!"
    end

    it "When user input wrong translate" do
      card.update_attribute :review_date, Date.today
      visit root_path
      puts page.body
      fill_in("translate", with: "asSds")
      click_button("Отправить")
      expect(page).to have_content "Неверный перевод"
    end
  end
end
