class Card < ActiveRecord::Base
  validates :original_text, :translated_text, presence: true
  validate  :check_if_fields_uniq_between_themselfs
  before_create :date_set
  scope :random_card, -> { where("review_date <= ?", Date.today).order("RANDOM()") }

  def valid_translation?(translation)
    if translated_text.upcase == translation.upcase
      true
    else
      false
    end
  end

  def mark_reviewed
    update_attribute :review_date, Date.today + 3.days
  end
  private

  def date_set
    self.review_date = Date.today
  end

  def check_if_fields_uniq_between_themselfs
    if original_text.upcase == translated_text.upcase
      errors.add(:translated_text, "Содержимое полей не может быть одинаковым!")
    end
  end
end
