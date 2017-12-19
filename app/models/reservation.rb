class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :listing
  # after_save :end_time, if: :end_time?

  TIME_OPTIONS = [ ["30 mins", 30], ["1 hour", 60] , ["1 hour 30 mins", 90], ["2 hours", 120]]


  # def end_time
  # 	self.update(end_time: self.start_time.to_datetime + self.duration.minutes)
  # end

  # def end_time?
  # 	self.end_time.nil?
  # end

end
