require 'rake'
require 'rspec/core/rake_task'
require 'turnip/rspec'

RSpec::Core::RakeTask.new(:spec) do |t|
  t.pattern = Dir.glob(['spec/**/*_spec.rb', 'spec/acceptance/**/*.feature'])
end

task default: :spec
