class Card < ActiveRecord::Base
before_save :date_set



  def date_set
    self.review_date = Time.now+3.days
  end

end
