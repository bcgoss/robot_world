require_relative '../test_helper'

class RobotWorldTest < Minitest::Test
  include TestHelpers
  def setup
    @data = {"id" => 1,
            "name" => "Bill",
            "city" => "Denver",
            "state" => "CO",
            "department" => "Waste Management",
            "manufacture_date" => "2016-08-18",
            "hire_date" => "2016-08-19",
            "avatar" => "https://robohash.org/0"}
    super
  end
  def test_it_creates_robots
    original_size = robot_world.all.count

    robot_world.create(@data)

    final_size = robot_world.all.count

    robot = robot_world.find(1)

    assert_equal 1, final_size - original_size
    assert_kind_of Robot, robot
    assert_equal 1, robot.id
    assert_equal "Bill", robot.name
    assert_equal "Waste Management", robot.department
    assert_equal "Denver", robot.city
    assert_equal "CO", robot.state
    assert_equal "2016-08-18", robot.manufacture_date
    assert_equal "2016-08-19", robot.hire_date
    assert_equal "https://robohash.org/0", robot.avatar
  end

  def test_it_destroys_robots

    robot_world.create(@data)

    original_size = robot_world.all.count

    robot_world.destroy(1)

    final_size = robot_world.all.count

    assert_equal 1, original_size - final_size
  end

  def test_it_updates_robots_names
    robot_world.create(@data)
  end
end
