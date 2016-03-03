class Card < ActiveRecord::Base
  validates_presence_of  :original_text, :translated_text
  validate :check




private
    def date_set
      self.review_date = Time.now+3.days
    end

    def check
     if original_text == self.translated_text
       errors.add(:translated_text, "Содержимое полей не может быть одинаковым!")
     end
    end


end
