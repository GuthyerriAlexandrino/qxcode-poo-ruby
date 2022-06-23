# frozen_string_literal: true

require_relative 'phone'

class Contact
	attr_accessor :name
	def initialize(name, phones)
		@name = name
		@phones = phones
		@phones = [] if @phones.nil? || !phones.instance_of?(Array)
	end

	def addPhone(phone)
		raise "Invalid phone" unless phone.valid?

		@phones << phone
	end

	def rmPhone(index)
		@phones.delete_at(index)
	end

	def addPhones(phones)
		phones.each do |p|
			begin
				addPhone(p)
			rescue Exception; end 
		end
	end

	def to_s
		str = "- #{@name} ".dup
		ei = :each_with_index
		@phones.send(ei) { |p, i| str << "[#{i}:#{p}] " }
		str
	end
end
