require 'yaml/store'
require_relative 'robot'

class RobotWorld
  attr_reader :database
  def initialize(database)
    @database = database
  end

  def create(robot)
    database.transaction do
      database['robots'] ||= []
      database['total'] ||= 0
      database['total'] += 1
      database['robots'] << { "id" => database['total'],
        "name" => robot["name"],
        "city" => robot["city"],
        "state"=> robot["state"],
        "department" => robot["department"],
        "manufacture_date" => robot["manufacture_date"],
        "hire_date" => robot["hire_date"],
        "avatar" => robot["avatar"]}
    end
  end

  def all
    raw_robots.map { |data| Robot.new(data) }
  end

  def find(id)
    Robot.new(raw_robot(id))
  end

  def update(id, robot_data)
    database.transaction do
      robot = database["robots"].find { |data| data["id"] == id }
      robot_data.each_pair do |key, value|
        robot[key] = value
      end
    end
  end

  def destroy(id)
    database.transaction do
      database["robots"].delete_if { |robot| robot["id"] == id}
    end
  end
  
  private
  def raw_robot(id)
    raw_robots.find { |robot| robot["id"] == id }
  end

  def raw_robots
    database.transaction do
      database["robots"] || []
    end
  end

  public
  def delete_all
    database.transaction do
      database["robots"] = []
      database["total"] = 0
    end
  end
end
