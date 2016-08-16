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
      database['robots'] << { "id" => database['total'] }
    end
  end

  def all
    raw_robots.map { |data| Robot.new(data) }
  end

  def raw_robots
    database.transaction do
      database["robots"] || []
    end
  end

  def raw_robot(id)
    raw_robots.find { |robot| robot["id"] == id }
  end
end
