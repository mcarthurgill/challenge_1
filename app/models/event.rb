class Event < ActiveRecord::Base
	validates :organizer_name, :title, :organizer_email, :presence => { :message => "- you must fill in this field" }
	validate :date_must_be_a_date_object
	validate :date_cannot_be_in_past
	validate :date_cannot_be_nil
	validates :title, :uniqueness => { :message => "is already taken."}

	def date_cannot_be_nil
		self.errors.add(:date, "can't be empty") if date.nil?
	end

	def date_cannot_be_in_past
		self.errors.add(:date, "can't be in the past") if date && date < Date.today
	end

	def date_must_be_a_date_object
		self.errors.add(:date, "must be chosen from the picker") unless date.is_a?(Date)
	end

end
