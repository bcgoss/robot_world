require_relative '../test_helper'

class DeleteRobotTest < FeatureTest
  def setup
    robot_world.create({"name" => "Bill",
            "city" => "Denver",
            "state" => "CO",
            "department" => "Waste Management",
            "manufacture_date" => "2016-08-18",
            "hire_date" => "2016-08-19",
            "avatar" => "https://robohash.org/0"})
    super
  end
  def test_it_deletes_robots
    visit '/robots'
    assert page.has_content?("Bill")
    within("form") do
      page.click_button("Delete")
    end

    assert_equal '/robots', current_path
    refute page.has_content?("Bill")
  end
end
