# frozen_string_literal: true

class Phone
	attr_accessor :id, :number

	def initialize(id, number)
		@id = id
		@number = number.to_s
		@valid = validate(number)
	end

	def valid? = @valid

	def validate(number)
		valid_number = number.split(') ')
		return false if valid_number.length != 2

		length = valid_number[1].length == 9
		digit = valid_number[1][0] == '9'
		prefix = valid_number[0] =~ /^\((\d{2})$/
		length && digit && !prefix.nil?
	end

	def to_s
		"#{@id}:#{@number}"
	end
end