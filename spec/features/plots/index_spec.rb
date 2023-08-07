require 'rails_helper'

RSpec.describe 'Plots Index Page', type: :feature do
    before(:each) do
        @garden1 = Garden.create!(name: "Turing Community Garden", organic: true)

        @plot1 = @garden1.plots.create!(number: 25, size: "Large", direction: "East")
        @plot2 = @garden1.plots.create!(number: 15, size: "Medium", direction: "West")
        @plot3 = @garden1.plots.create!(number: 10, size: "Small", direction: "East")


        @plant1 = @plot1.plants.create!(name: "Purple Beauty Sweet Bell Pepper", description: "Prefers rich, well draining soil.", days_to_harvest: 90)
        @plant2 = @plot1.plants.create!(name: "Carrot", description: "A carrot description.", days_to_harvest: 40)
        @plant3 = @plot1.plants.create!(name: "Onion", description: "A Onion description.", days_to_harvest: 30)

        @plant4 = @plot2.plants.create!(name: "Carrot", description: "A carrot description.", days_to_harvest: 40)
        @plant5 = @plot2.plants.create!(name: "Tomato", description: "A Tomato description.", days_to_harvest: 20)
        @plant6 = @plot2.plants.create!(name: "Sqaush", description: "A Squash description.", days_to_harvest: 45)

        @plant7 = @plot3.plants.create!(name: "Carrot", description: "A carrot description.", days_to_harvest: 40)
        @plant8 = @plot3.plants.create!(name: "Celery", description: "A celery description.", days_to_harvest: 30)
        @plant9 = @plot3.plants.create!(name: "Garlic", description: "A garlic description.", days_to_harvest: 25)

        
    end
    describe 'As a visitor' do
        describe 'Which I visit the plots index page /plots' do
            it 'Shows a list of all plot numbers, under each I see the name of all that plots plants' do
                visit plots_path
                
                within "#plot_#{@plot1.id}" do
                    expect(page).to have_content(@plot1.number)
                    expect(page).to have_content(@plant1.name)
                    expect(page).to have_content(@plant2.name)
                    expect(page).to have_content(@plant3.name)
                end

                within "#plot_#{@plot2.id}" do
                    expect(page).to have_content("Plot Number: #{@plot2.number}")
                    expect(page).to have_content(@plant4.name)
                    expect(page).to have_content(@plant5.name)
                    expect(page).to have_content(@plant6.name)
                end
            end

            it 'has a button to delete a plant from a plot' do
                
                visit plots_path
                # binding.pry;
                
                within "#plot_#{@plot1.id}" do
                    expect(page).to have_content(@plant2.name)
                    expect(page).to have_button("Delete #{@plant2.name}")
                end
                within "#plot_#{@plot1.id}" do
                    click_button "Delete #{@plant2.name}"
                end
                
                visit plots_path

                within "#plot_#{@plot1.id}" do
                    expect(page).to_not have_content(@plant2.name)
                end
                

                within "#plot_#{@plot2.id}" do
                    expect(page).to have_content(@plant4.name)
                    expect(page).to have_button("Delete #{@plant4.name}")
                end
            end
        end
    end

end