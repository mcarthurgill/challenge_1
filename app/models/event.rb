class Event < ActiveRecord::Base
	validates :date, :presence => true 
	validate :date_cannot_be_in_past
	validate :date_must_be_a_date_object

	####more validations

	def date_cannot_be_in_past
		self.errors.add(:date, "cant be in the past") if date < Date.today
	end

	def date_must_be_a_date_object
		self.errors.add(:date, "must be a date object") unless date.is_a?(Date)
	end

end
