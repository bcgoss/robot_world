class Robot
  attr_reader :name,
              :department,
              :city,
              :state,
              :manufacture_date,
              :hire_date,
              :avatar,
              :id
  def initialize(robot_data)
    @id = robot_data["id"]
    @name = robot_data["name"]
    @department = robot_data["department"]
    @city = robot_data["city"]
    @state = robot_data["state"]
    @manufacture_date = robot_data["manufacture_date"]
    @hire_date = robot_data["hire_date"]
    @avatar = robot_data["avatar"]
  end
end
