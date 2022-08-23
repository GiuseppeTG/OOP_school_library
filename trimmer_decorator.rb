require_relative './base_decorator'

class TrimmerDecorator < BaseDecorator
  def correct_name
    name = @nameable.correct_name
    return name[0..9] if name.length > 10

    name
  end
end
