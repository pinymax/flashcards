class Card < ActiveRecord::Base
  validates :original_text, :translated_text, presence: true
  validate  :check_if_fields_uniq_between_themselfs
#  before_save :date_set
  scope :checktime, -> { Card.where("review_date <= ?", Date.today) }

  def self.random_card
    offset = rand(checktime.count)
    train = checktime.offset(offset).first
    train
  end

  def self.traing(train)
    if train
      train.review_date = Time.now + 3.days
      train.save
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
