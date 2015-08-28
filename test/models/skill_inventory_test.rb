require_relative '../test_helper'

class SkillInventoryTest < Minitest::Test

  def test_it_creates_a_skill
    attributes = {:title       => "a title",
                  :description => "a description"}

    skill = SkillInventory.create(attributes)
    skill = SkillInventory.find(skill.id)

    assert_equal "a title", skill.title
    assert_equal "a description", skill.description
  end

  def test_it_finds_all_skills
    attributes = {:title       => "a title",
                  :description => "a description"}
    SkillInventory.create(attributes)
    SkillInventory.create(attributes)

    assert_equal 2, SkillInventory.all.count
  end

  def test_it_finds_a_task_by_id
    attributes = {:title       => "a title",
                  :description => "a description"}

    skill = SkillInventory.create(attributes)
    SkillInventory.create(attributes)

    assert_equal "a title", SkillInventory.find(skill.id).title
  end

  def test_it_updates_a_skill
    attributes = {:title       => "a title",
                  :description => "a description"}

    skill = SkillInventory.create(attributes)

    assert_equal "a title", skill.title
    skill.title = "a new title"
    SkillInventory.update(skill.id, skill)

    assert_equal "a new title", skill.title
  end

  def test_it_deletes_a_skill
    attributes = {:title       => "a title",
                  :description => "a description"}
    skill = SkillInventory.create(attributes)
    SkillInventory.create(attributes)

    total = SkillInventory.all.count
    assert_equal 2, total

    SkillInventory.delete(skill.id)

    total = SkillInventory.all.count
    assert_equal 1, total
  end
end
