require_relative '../test_helper'

class UserCanMoveAroundTheSiteTest < FeatureTest
  def test_that_root_dir_is_correct
    visit '/'
    assert_equal '/', current_path
  end

  def test_user_can_navigate_to_skills_view
    visit '/'
    click_link 'view skills'
    assert_equal '/skills', current_path
  end

  def test_user_can_navigate_to_new_view
    visit '/'
    click_link "Add a New Skill"
    assert_equal "/skills/new", current_path
  end
end
