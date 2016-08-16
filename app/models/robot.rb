class Robot
  attr_reader :name,
              :city,
              :state,
              :department,
              :manufacturedate,
              :hiredate
  def initialize(robot_data)
    @name = robot_data["name"]
    @city = robot_data["city"]
    @state = robot_data["state"]
    @department = robot_data["department"]
    @manufacture_date = robot_data["manufacture_date"]
    @hire_date = robot_data["hire_date"]
  end
end
