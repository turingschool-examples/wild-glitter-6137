# Community Garden

This repository requires and has been tested on Ruby v3.2.2 and is based on Rails 7.0.6.

RSpec and Shoulda-Matchers have been installed and set up.

## Setup

1. fork this repo
2. clone your fork
3. `git clone <repo_name>`
4. `cd <repo_name>`
5. `bundle install`
6. `rails db:{drop,create,migrate,seed}`

When you run `bundle exec rspec` you should have 2 passing tests.

## Instructions

* Work on this assessment independently. DO NOT discuss with anyone.
* You are allowed to use any references including notes, Google, lesson plans, etc.
* Read each story carefully before you start working.
* Commit Frequently, about every 15 - 30 minutes
* Push your code to your fork **once the time is up (not before!)**

## Submission

**Once the time for the assessment is up**, push your code to your fork and create a pull request to the `turingschool-examples` repository. Include the following:

* Your Name
* A reflection on how you felt you did with this challenge and what story you got through

## Requirements

* TDD all new work
* Model methods and relationships must be fully tested.
* Scaffolding is not permitted on this assessment.

## Not Required

* No visual styling is required or expected
* You do not need to test for or create any model validations.


## Overview

Community Garden is an app that tracks Gardens, Plots, and Plants.

* Gardens have a name and an 'organic' column
  * Ex: `name: "Turing Community Garden", organic: true`

* Plots have a number, size, and a direction
 	* Ex: `number: 25, size: "Large", direction: "East"`

* Plants have a name, description, and days to harvest.
  * Ex: `name: "Purple Beauty Sweet Bell Pepper", description: "Prefers rich, well draining soil.", days_to_harvest: 90`
  
* Gardens have many plots - Parent
* Plots belong to a Garden - Child

* Plants can be in many Plots -  Many to Many
* Plots have many Plants -  Many to Many
  plant_plots is the join table

Some of the initial migrations and model set up has been done for you.

## User Stories

```
User Story 1, Plots Index Page

As a visitor
When I visit the plots index page ('/plots')
I see a list of all plot numbers
And under each plot number I see the names of all that plot's plants
```

```
User Story 2, Remove a Plant from a Plot

As a visitor
When I visit the plots index page
Next to each plant's name
I see a link to remove that plant from that plot
When I click on that link
I'm returned to the plots index page
And I no longer see that plant listed under that plot,
And I still see that plant's name under other plots that is was associated with.

Note: you do not need to test for any sad paths or implement any flash messages. 
```

```
User Story 3, Garden's Plants

As a visitor
When I visit a garden's show page ('/gardens/:id')
Then I see a list of plants that are included in that garden's plots
And I see that this list is unique (no duplicate plants)
And I see that this list only includes plants that take less than 100 days to harvest
```

## Extensions

```
Extension 1

As a visitor
When I visit a garden's show page,
Then I see the list of plants is sorted by the number of times the plant appears in any of that garden's plots from most to least
(Note: you should only make 1 database query to retrieve the sorted list of plants)
```