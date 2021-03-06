class Card < ActiveRecord::Base
  has_attached_file :avatar, styles: { medium: "300x300" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  belongs_to :user
  validates :original_text, :translated_text, presence: true
  validate  :check_if_fields_uniq_between_themselfs
  before_create :date_set
  scope :random_card, -> { where("review_date <= ?", Date.today).order("RANDOM()") }

  def valid_translation?(translation)
    translated_text.casecmp(translation).zero?
  end

  def mark_reviewed
    update_attribute :review_date, Date.today + 3.days
  end
  private

  def date_set
    self.review_date = Date.today + 3.days
  end

  def check_if_fields_uniq_between_themselfs
    if original_text.casecmp(translated_text).zero?
      errors.add(:translated_text, "Содержимое полей не может быть одинаковым!")
    end
  end
end
