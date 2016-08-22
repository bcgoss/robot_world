require_relative '../test_helper'

class UserSeesAllRobotsTest < FeatureTest
  def test_user_sees_robots
    robot_world.create({"name" => "George",
                        "department" => "Waste Management",
                        "city" => "Denver",
                        "state" => "CO",
                        "manufacture_date" => '2016-08-17',
                        "hire_date" => '2016-08-21',
                        "avatar" => "https://robohash.org/0"})
    robot_world.create({name: "Bill",
                        department: "Engineering",
                        city: "Flint",
                        state: "MI",
                        manufacture_date: '2016-08-17',
                        hire_date: '2016-08-21',
                        avatar: "https://robohash.org/1"})

    visit '/robots'
    assert page.has_content?("George")
    assert page.has_content?("Bill")
  end
end
