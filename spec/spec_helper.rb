# This file was generated by the `rails generate rspec:install` command. Conventionally, all
# specs live under a `spec` directory, which RSpec adds to the `$LOAD_PATH`.
# The generated `.rspec` file contains `--require spec_helper` which will cause
# this file to always be loaded, without a need to explicitly require it in any
# files.
def test_data
  @garden_1 = Garden.create!(name: "Denver Botanic Gardens", organic: true)
  @garden_2 = Garden.create!(name: "Dubai Mircale Garden", organic: true)
  @garden_3 = Garden.create!(name: "Gardens of Villandry", organic: true)

  @plot_1 = @garden_1.plots.create!(number: 13, size: "Large", direction: "North")
  @plot_2 = @garden_1.plots.create!(number: 14, size: "Small", direction: "South")
  @plot_3 = @garden_2.plots.create!(number: 2, size: "Large", direction: "East")
  @plot_4 = @garden_2.plots.create!(number: 3, size: "Medium", direction: "North")
  @plot_5 = @garden_3.plots.create!(number: 25, size: "Small", direction: "West")
  @plot_6 = @garden_3.plots.create!(number: 26, size: "Small", direction: "South")

  @plant_1 = Plant.create!(name: "Hydnora", description: "It's a parasite that latches on to the roots of other species and grows entirely underground except for the flower.", days_to_harvest: 85)
  @plant_2 = Plant.create!(name: "Purple Pitcher Plant", description: "Insects are trapped inside the plant after they slide down the plants slimy innards by small hairs tilted downward inside the plant.", days_to_harvest: 90)
  @plant_3 = Plant.create!(name: "Parachute flower", description: "The flower's smell beckons insects inside. Once there, the insects are trapped but not eaten by the plant.", days_to_harvest: 90)
  @plant_4 = Plant.create!(name: "Hammer orchid", description: "The plant produces pheromones — chemicals that alter the behavior of a creature of the same species — that draw male wasps who may mistake the orchid for a female wasp.", days_to_harvest: 105)
  @plant_5 = Plant.create!(name: "Suicide palm", description: "At the end of its life, the stem tips explode in a massive show of tiny flowers capable of being pollinated and developing into fruit as it dies.", days_to_harvest: 3650)
  @plant_6 = Plant.create!(name: "Strangler fig", description: "A 'parasitic nightmare', when the fig grows downward, it robs its host, usually a living tree, of its nutrients. When the fig grows upward, its leaves block sunlight from reaching the host.", days_to_harvest: 7300)
  
  @plot_1.plot_plants.create!(plant: @plant_2)
  @plot_1.plot_plants.create!(plant: @plant_4)
  @plot_1.plot_plants.create!(plant: @plant_1)
  @plot_1.plot_plants.create!(plant: @plant_6)

  @plot_2.plot_plants.create!(plant: @plant_6)

  @plot_3.plot_plants.create!(plant: @plant_1)
  @plot_3.plot_plants.create!(plant: @plant_5)
  @plot_3.plot_plants.create!(plant: @plant_4)

  @plot_4.plot_plants.create!(plant: @plant_4)
  @plot_4.plot_plants.create!(plant: @plant_3)

  @plot_5.plot_plants.create!(plant: @plant_2)

  @plot_6.plot_plants.create!(plant: @plant_3)
  @plot_6.plot_plants.create!(plant: @plant_1)
end
# Given that it is always loaded, you are encouraged to keep this file as
# light-weight as possible. Requiring heavyweight dependencies from this file
# will add to the boot time of your test suite on EVERY test run, even for an
# individual file that may not need all of that loaded. Instead, consider making
# a separate helper file that requires the additional dependencies and performs
# the additional setup, and require it from the spec files that actually need
# it.
#
# See https://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
RSpec.configure do |config|
  # rspec-expectations config goes here. You can use an alternate
  # assertion/expectation library such as wrong or the stdlib/minitest
  # assertions if you prefer.
  config.expect_with :rspec do |expectations|
    # This option will default to `true` in RSpec 4. It makes the `description`
    # and `failure_message` of custom matchers include text for helper methods
    # defined using `chain`, e.g.:
    #     be_bigger_than(2).and_smaller_than(4).description
    #     # => "be bigger than 2 and smaller than 4"
    # ...rather than:
    #     # => "be bigger than 2"
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  # rspec-mocks config goes here. You can use an alternate test double
  # library (such as bogus or mocha) by changing the `mock_with` option here.
  config.mock_with :rspec do |mocks|
    # Prevents you from mocking or stubbing a method that does not exist on
    # a real object. This is generally recommended, and will default to
    # `true` in RSpec 4.
    mocks.verify_partial_doubles = true
  end

  # This option will default to `:apply_to_host_groups` in RSpec 4 (and will
  # have no way to turn it off -- the option exists only for backwards
  # compatibility in RSpec 3). It causes shared context metadata to be
  # inherited by the metadata hash of host groups and examples, rather than
  # triggering implicit auto-inclusion in groups with matching metadata.
  config.shared_context_metadata_behavior = :apply_to_host_groups

# The settings below are suggested to provide a good initial experience
# with RSpec, but feel free to customize to your heart's content.
=begin
  # This allows you to limit a spec run to individual examples or groups
  # you care about by tagging them with `:focus` metadata. When nothing
  # is tagged with `:focus`, all examples get run. RSpec also provides
  # aliases for `it`, `describe`, and `context` that include `:focus`
  # metadata: `fit`, `fdescribe` and `fcontext`, respectively.
  config.filter_run_when_matching :focus

  # Allows RSpec to persist some state between runs in order to support
  # the `--only-failures` and `--next-failure` CLI options. We recommend
  # you configure your source control system to ignore this file.
  config.example_status_persistence_file_path = "spec/examples.txt"

  # Limits the available syntax to the non-monkey patched syntax that is
  # recommended. For more details, see:
  # https://rspec.info/features/3-12/rspec-core/configuration/zero-monkey-patching-mode/
  config.disable_monkey_patching!

  # Many RSpec users commonly either run the entire suite or an individual
  # file, and it's useful to allow more verbose output when running an
  # individual spec file.
  if config.files_to_run.one?
    # Use the documentation formatter for detailed output,
    # unless a formatter has already been configured
    # (e.g. via a command-line flag).
    config.default_formatter = "doc"
  end

  # Print the 10 slowest examples and example groups at the
  # end of the spec run, to help surface which specs are running
  # particularly slow.
  config.profile_examples = 10

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = :random

  # Seed global randomization in this process using the `--seed` CLI option.
  # Setting this allows you to use `--seed` to deterministically reproduce
  # test failures related to randomization by passing the same `--seed` value
  # as the one that triggered the failure.
  Kernel.srand config.seed
=end
end
