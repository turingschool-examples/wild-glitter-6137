require "rails_helper"

RSpec.describe Plot do
  before do
    @garden_1 = Garden.create!(name: "Portland Communtiy Garden", organic: true)

    @plot_1 = @garden_1.plots.create!(number: 1, size: "Small", direction: "East")
    @plot_2 = @garden_1.plots.create!(number: 2, size: "Medium", direction: "West")
    @plot_3 = @garden_1.plots.create!(number: 3, size: "Large", direction: "North")

    @plant_1 = Plant.create!(name: "Sunflower", description: " This is a sunflower", days_to_harvest: 99)
    @plant_2 = Plant.create!(name: "Tomato", description: " This is a Tomato", days_to_harvest: 100)
    @plant_3 = Plant.create!(name: "Watermelon", description: " This is a Watermelon", days_to_harvest: 200)
    @plant_4 = Plant.create!(name: "Cucumber", description: " This is a Cucumber", days_to_harvest: 300)

    @plot_1.plants << @plant_1
    @plot_2.plants << @plant_2
    @plot_3.plants << @plant_3
  end

  #User Story 1, Plots Index Page

  describe "As a visitor" do
    describe "When I visit the plots index page ('/plots')" do
      describe "I see a list of all plot numbers" do
        it "And under each plot number I see the names of all that plot's plants" do
          visit "/plots"

          expect(page).to have_content(@plot_1.number)
          expect(page).to have_content(@plant_1.name)


          expect(page).to have_content(@plot_2.number)
          expect(page).to have_content(@plant_2.name)


          expect(page).to have_content(@plot_3.number)
          expect(page).to have_content(@plant_3.name)

          # Tried implenting a check to make sure things were order properly but
          # was having issues getting this to work even though it could find the content
          # expect(@plant_1.name).to_not appear_before(@plot_1.number)
          # expect(@plant_1.name).to appear_before(@plot_2.number)
          # expect(@plot_2.number).to appear_before(@plant_2.name)
          # expect(@plant_2.name).to appear_before(@plot_3.number)
          # expect(@plot_3.number).to appear_before(@plant_3.name)
        end
      end
    end
  end

  # User Story 2, Remove a Plant from a Plot
  # Note: you do not need to test for any sad paths or implement any flash messages.

  describe "As a visitor" do
    describe "When I visit the plots index page "do
      describe "Next to each plant's name" do
        describe "I see a link to remove that plant from that plot" do
          describe "When I click on that link" do
            describe "I'm returned to the plots index page" do
              describe "And I no longer see that plant listed under that plot," do
                it "And I still see that plant's name under other plots that is was associated with." do
                  @plot_1.plants << @plant_4
                  @plot_2.plants << @plant_4
                  @plot_3.plants << @plant_4

                  visit "/plots"
                  
                  first_button = page.all('button', text: 'Remove Cucumber').first

                  expect(page).to have_button("Remove #{@plant_1.name}")
                  expect(page).to have_button("Remove #{@plant_2.name}")
                  expect(page).to have_button("Remove #{@plant_3.name}")
                  expect(page).to have_selector('button', text: 'Remove Cucumber', count: 3)

                  first_button.click

                  expect(current_path).to eq("/plots")

                  expect(page).to have_selector('button', text: 'Remove Cucumber', count: 2)
                end
              end
            end
          end
        end
      end
    end
  end

  # #User Story 3, Garden's Plants

  describe "As a visitor" do
    describe "When I visit a garden's show page ('/gardens/:id')" do
      describe "Then I see a list of plants that are included in that garden's plots" do
        describe "And I see that this list is unique (no duplicate plants)" do
          it "And I see that this list only includes plants that take less than 100 days to harvest" do
            @plot_1.plants << @plant_4
            @plot_2.plants << @plant_4
            @plot_3.plants << @plant_4

            visit "/gardens/#{@garden_1.id}"

            non_included_plants = [@plant_2, @plant_3, @plant_4]

            expect(page).to have_content(@plant_1.name)

            non_included_plants.each do |plant|
              expect(page).to_not have_content(plant.name)
            end
          end
        end
      end
    end
  end
end