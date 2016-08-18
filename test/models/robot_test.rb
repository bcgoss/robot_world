require_relative '../test_helper'

class RobotTest < Minitest::Test
  include TestHelpers
  def test_accessing
    data = {"id" => 1,
            "name" => "George",
            "department" => "Engineering",
            "city" => "Denver",
            "state" => "CO",
            "manufacture_date" => "2016-08-17",
            "hire_date" => "2016-08-17",
            "avatar" => "https://robohash.org/1"}
    robot = Robot.new(data)
    assert_equal 1, robot.id
    assert_equal "George", robot.name
    assert_equal "Engineering", robot.department
    assert_equal "Denver", robot.city
    assert_equal "CO", robot.state
    assert_equal "2016-08-17", robot.manufacture_date
    assert_equal "2016-08-17", robot.hire_date
    assert_equal "https://robohash.org/1", robot.avatar
  end
end
