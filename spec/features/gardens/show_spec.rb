require 'rails_helper'

RSpec.describe 'Garden Show Page', type: :feature do
    before(:each) do
        @garden1 = Garden.create!(name: "Turing Community Garden", organic: true)

        @plot1 = @garden1.plots.create!(number: 25, size: "Large", direction: "East")
        @plot2 = @garden1.plots.create!(number: 15, size: "Medium", direction: "West")
        @plot3 = @garden1.plots.create!(number: 10, size: "Small", direction: "East")


        @plant1 = @plot1.plants.create!(name: "Purple Beauty Sweet Bell Pepper", description: "Prefers rich, well draining soil.", days_to_harvest: 90)
        @plant2 = @plot1.plants.create!(name: "Carrot", description: "A carrot description.", days_to_harvest: 40)
        @plant3 = @plot1.plants.create!(name: "Onion", description: "A Onion description.", days_to_harvest: 30)

        @plant4 = @plot2.plants.create!(name: "Carrot", description: "A carrot description.", days_to_harvest: 40)
        @plant5 = @plot2.plants.create!(name: "Tomato", description: "A Tomato description.", days_to_harvest: 120)
        @plant6 = @plot2.plants.create!(name: "Sqaush", description: "A Squash description.", days_to_harvest: 45)

        @plant7 = @plot3.plants.create!(name: "Carrot", description: "A carrot description.", days_to_harvest: 40)
        @plant8 = @plot3.plants.create!(name: "Celery", description: "A celery description.", days_to_harvest: 130)
        @plant9 = @plot3.plants.create!(name: "Garlic", description: "A garlic description.", days_to_harvest: 25)
        
    end

    describe 'As a visitor' do
        describe 'When I visit a gardens show page /gardens/:id' do
            it 'Shows a list of plants that are in that gardens plots, the list is unique and only includes plants that take lesss then 100 days' do
                visit garden_path(@garden1)

                within "#garden_plants" do

                    expect(page).to have_content(@plant1.name)
                    expect(page).to have_content(@plant2.name)
                    expect(page).to have_content(@plant3.name)
                    expect(page).to have_content(@plant6.name)
                    expect(page).to have_content(@plant9.name)

                    expect(page).to_not have_button(@plant4.name)
                    expect(page).to_not have_button(@plant5.name)
                    expect(page).to_not have_button(@plant7.name)
                    expect(page).to_not have_button(@plant8.name)
                    
                end
            end
        end
    end
end