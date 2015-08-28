require_relative '../test_helper'

class UserSeesAllTasksTests < FeatureTest


  def test_front_page_has_welcome_content
    visit '/'
    assert page.has_content?("Welcome to Skill Inventory")
    assert page.has_content?("View Skills")
    assert page.has_content?("Add a New Skill")
  end

  def test_front_page_has_welcome_content_2
    visit '/'
    within('#intro-h1') do
      assert page.has_content?("Welcome to Skill Inventory")
    end
  end

  def test_home_page_renders_with_css
    visit("/")
    assert page.has_css?("body", "html")
    within(".container") do
      assert page.has_content?("Task Index")
    end
  end

  def test_it_can_create_a_new_skill
    visit '/'
    click_link "Add a New Skill"
    fill_in "skill[title]", with: "Ruby"
    fill_in "skill[description]", with: "Sinatra"
    click_link_or_button "Submit"
    assert_equal "/skills", current_path
    assert page.has_content?("Ruby")
  end

  def test_it_can_edit_a_skill
    visit '/'
    click_link "Add a New Skill"
    fill_in "skill[title]", with: "Ruby"
    fill_in "skill[description]", with: "Sinatra"
    click_link_or_button "Submit"
    click_link_or_button "Edit"
    fill_in "skill[title]", with: "Javascript"
    click_link_or_button "Submit"
    assert_equal "/skills/1", current_path
    assert page.has_content?("Javascript")
  end

  def test_it_can_delete_a_skill
    visit '/'
    click_link "Add a New Skill"
    fill_in "skill[title]", with: "Ruby"
    fill_in "skill[description]", with: "Rails"
    click_link_or_button "Submit"
    click_link_or_button "delete/"
    assert_equal "/skills", current_path
  end

end
