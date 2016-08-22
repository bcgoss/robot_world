require_relative '../test_helper'

class NewRobot < FeatureTest
  def test_users_create_new_robots
    visit '/'
    within(".nav .navbar-nav") do
      page.click_link("New Robot")
    end
    assert_equal '/robots/new', current_path

    fill_in("robot[name]", with: "Bill")
    fill_in("robot[city]", with: "Flint")
    fill_in("robot[state]", with: "MI")
    fill_in("robot[department]", with: "Sanitation")
    fill_in("robot[manufacture_date]", with: "2016-01-01")
    fill_in("robot[hire_date]", with: "2016-08-21")
    fill_in("robot[avatar]", with: "https://robohash.org/65")

    click_button("Submit")
    assert_equal '/robots', current_path
    assert page.has_content?("Bill")
  end
end
