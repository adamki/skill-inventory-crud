require_relative '../test_helper'

class SkillTest < Minitest::Test
  def test_it_assigns_the_proper_attributes
    attributes = {"id" => 1, "description" => "jQuery", "skill" => "JavaScript"}
    skill = Skill.new(attributes)
    assert_equal 1, skill.id
    assert_equal "jQuery", skill.description
    assert_equal "JavaScript", skill.title
  end
end
