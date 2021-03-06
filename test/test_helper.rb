ENV["RACK_ENV"] ||= "test"

require File.expand_path("../../config/environment", __FILE__)
require 'minitest/autorun'
require 'minitest/pride'
require 'capybara'
require 'tilt/erb'

class Minitest::Test
  def teardown
    SkillInventory.delete_all
  end
end

  Capybara.app = SkillInventoryApp
  Capybara.save_and_open_page_path = "/tmp"

class FeatureTest < Minitest::Test
  include Capybara::DSL
end
