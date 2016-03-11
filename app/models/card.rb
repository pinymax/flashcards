class Card < ActiveRecord::Base
  validates :original_text, :translated_text, presence: true
  validate  :check_if_fields_uniq_between_themselfs
  before_save :date_set
  scope :random_card, -> { where("review_date <= ?", Date.today).order("RANDOM()") }

  def checker(translate)
    if self.translated_text.upcase == translate.upcase
      self.review_date = Time.now + 3.days
      self.save
      true
    else
      false
    end
  end

  private

    def date_set
      self.review_date = Date.today + 3.days
    end

    def check_if_fields_uniq_between_themselfs
     if self.original_text.upcase == self.translated_text.upcase
       errors.add(:translated_text, "Содержимое полей не может быть одинаковым!")
     end
    end
end
