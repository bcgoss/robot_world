require_relative '../spec_helper.rb'

describe Robot do
  let(:robot) {Robot.new({"id" => 1,
          "name" => "George",
          "department" => "Engineering",
          "city" => "Denver",
          "state" => "CO",
          "manufacture_date" => "2016-08-17",
          "hire_date" => "2016-08-17",
          "avatar" => "https://robohash.org/1"})}

  it "has a name" do
    expect(robot.name).to eq("George")
  end

  it "has a department" do
    expect(robot.department).to eq("Engineering")
  end

  it "has a city" do
    expect(robot.city).to eq("Denver")
  end

  it "has a state" do
    expect(robot.state).to eq("CO")
  end

  it "has a manufacture date" do
    expect(robot.manufacture_date).to eq('2016-08-17')
  end

  it "has a hire date" do
    expect(robot.hire_date).to eq("2016-08-17")
  end

  it "has an avatar" do
    expect(robot.avatar).to eq("https://robohash.org/1")
  end

end
