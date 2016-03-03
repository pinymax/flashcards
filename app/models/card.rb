class Card < ActiveRecord::Base
  validates_presence_of  :original_text, :translated_text
  validate :check
  before_save :date_set




private
    def date_set
      self.review_date = Time.now+3.days
    end

    def check
     if original_text.upcase == self.translated_text.upcase
       errors.add(:translated_text, "Содержимое полей не может быть одинаковым!")
     end
    end


end
