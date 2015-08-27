require_relative '../test_helper'

class SkillInventoryTest < Minitest::Test
  def test_it_creates_a_task
    attributes = {id: 1, description: "D-S-A", title: "Ruby"}
    SkillInventory.create(attributes)
    skill = SkillInventory.find(1)

    assert_equal 1, skill.id
    assert_equal "D-S-A", skill.description
    assert_equal "Ruby", skill.title
  end

end
