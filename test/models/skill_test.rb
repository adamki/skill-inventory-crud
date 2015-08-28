require_relative '../test_helper'

class SkillTest < Minitest::Test
  def test_assigns_attributes_correctly
    skill = Skill.new({:description => "jQuery",
                       :title       => "JavaScript",
                       :id          => 1 })
    assert_equal 1, skill.id
    assert_equal "jQuery", skill.description
    assert_equal "JavaScript", skill.title
  end
end
