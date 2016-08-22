require_relative '../spec_helper'
require 'pry'
describe RobotWorld do

  before(:all) do
    database = SQLite3::Database.new('db/robot_world_test.db')
    database.results_as_hash = true
    @robot_world = RobotWorld.new(database)
  end

  let(:robot_data) {@robot_data = {"id" => 1,
          "name" => "George",
          "department" => "Engineering",
          "city" => "Denver",
          "state" => "CO",
          "manufacture_date" => "2016-08-17",
          "hire_date" => "2016-08-17",
          "avatar" => "https://robohash.org/1"}}

  let(:robot) {Robot.new(robot_data)}
  let(:last_id) {@robot_world.all.last.id}

  after(:each) do
    @robot_world.delete_all
  end

  describe "#all" do
    it 'returns an array' do expect(@robot_world.all).to be_an(Array) end
    it 'begins empty' do expect(@robot_world.all).to eq([]) end

    it 'has robots in the array' do
      @robot_world.create(robot_data)
      expect(@robot_world.all.first).to be_a(Robot)
    end
  end

  describe "#create" do
    it "adds a robot to the list" do
      expect { @robot_world.create(robot_data) }.to change{@robot_world.all.count}.by(1)
    end
  end

  describe "#find" do
    it "returns a robot" do
      @robot_world.create(robot_data)
      expect(@robot_world.find(last_id)).to be_a(Robot)
    end

    it "matchs the details of the robot" do
      @robot_world.create(robot_data)
      expect(@robot_world.find(last_id).name).to eq(robot.name)
      expect(@robot_world.find(last_id).department).to eq(robot.department)
    end
  end

  describe "#update" do
    it "changes the name" do
      params = {robot: robot_data}
      @robot_world.create(params[:robot])
      params[:robot]["name"] = "Bill"
      expect {@robot_world.update(last_id, params[:robot])}.to change{@robot_world.find(last_id).name}.from("George").to("Bill")
    end
  end

  describe "#destroy" do
    it "removes a robot" do
      @robot_world.create(robot_data)
      expect{@robot_world.destroy(last_id)}.to change{@robot_world.all.count}.by(-1)
    end
  end
end
