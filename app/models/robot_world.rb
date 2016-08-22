require_relative 'robot'

class RobotWorld
  attr_reader :database
  def initialize(database)
    @database = database
  end

  def all
    raw_robots.map { |data| Robot.new(data) }
  end

  def find(id)
    Robot.new(raw_robot(id))
  end

  def create(robot)
    statement = "INSERT INTO robots ("
    statement += robot.keys.join(", ")
    statement += ") VALUES ("
    statement += robot.values.map {|value| "'#{value}'"}.join(", ") + ");"

    database.execute(statement)
  end

  def update(id, robot_data)
    statement = "UPDATE robots SET "
    robot_data.each_pair do |key, value|
      statement += "#{key.to_s} = '#{value}', "
    end
    statement.chomp!(", ")
    statement += "WHERE id = #{id};"
    database.execute(statement)
  end

  def destroy(id)
    database.execute("DELETE FROM robots WHERE id = ?;", id)
  end

  private
  def raw_robot(id)
    database.execute("SELECT * FROM robots WHERE id = :id;", {"id" => id}).first
  end

  def raw_robots
    database.execute("SELECT * FROM robots;")
  end

  public
  def delete_all
    database.execute("DELETE FROM robots;")
  end
end
