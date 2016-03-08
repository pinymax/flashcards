class Card < ActiveRecord::Base
  validates :original_text, :translated_text, presence: true
  validate  :check_if_fields_uniq_between_themselfs
  #before_save :date_set
  scope :random_card, -> { where("review_date <= ?", Date.today).order("RANDOM()") }

  def self.checker(card, transl)
    if card.translated_text.upcase == transl.upcase
      card.review_date = Date.today + 3.days
      card.save
    end
  end

  private

    def date_set
      self.review_date = Time.now+3.days
    end

    def check_if_fields_uniq_between_themselfs
     if original_text.upcase == self.translated_text.upcase
       errors.add(:translated_text, "Содержимое полей не может быть одинаковым!")
     end
    end
end
