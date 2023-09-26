class Attendee
  attr_reader :name, :budget
  def initialize(attendee_details)
    @name = attendee_details[:name]
    @budget = attendee_details[:budget].delete("$").to_f
  end

end