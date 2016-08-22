require_relative '../test_helper'

class GreetingPageTest < FeatureTest
  def test_it_greets_visitors
    visit '/'
    within('h1') do
      assert page.has_content?("Welcome to Robot World")
    end
  end
end
