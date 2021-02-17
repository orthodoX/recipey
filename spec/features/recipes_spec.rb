require "rails_helper"

RSpec.describe "Rendnering recipes", type: :feature do
  describe "Displaying recipes" do
    # rubocop:disable RSpec/ExampleLength
    it "Lists and displays detailed info of recipes" do
      visit recipes_path

      expect(page).to have_content("Marley Spoon recipes of the day")
      expect(page).to have_css("a.recipe")

      find("a.recipe:first").click

      expect(page).to have_css(".image")
      expect(page).to have_css(".title")
      expect(page).to have_css(".content")

      click_link "Back"

      expect(page).to have_content("Marley Spoon recipes of the day")
    end
    # rubocop:enable RSpec/ExampleLength
  end
end
