# frozen_string_literal: true

# This class knows all the claims for a given tambola ticket
class Ticket
  attr_reader :ticket, :picked_numbers

  FIRST_LINE_NUMBER = 0
  MIDDLE_LINE_NUMBER = 1
  LAST_LINE_NUMBER = 2

  def initialize(ticket, picked_numbers = [])
    @ticket = ticket
    @picked_numbers = picked_numbers
  end

  def marked_numbers
    @marked_numbers ||=
      ticket.flatten.select { |number| picked_numbers.include?(number) }
  end

  def first_line_done?
    line_done?(FIRST_LINE_NUMBER)
  end

  def middle_line_done?
    line_done?(MIDDLE_LINE_NUMBER)
  end

  def last_line_done?
    line_done?(LAST_LINE_NUMBER)
  end

  def line_done?(line_number)
    return if line_number > 2

    ticket[line_number].all? { |number| picked_numbers.include?(number) }
  end
end
