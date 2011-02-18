desc 'Run specs with coverage'
task :rcov => :environment do
  RSpec::Core::RakeTask.new(:rcov) do |t|
    t.rspec_opts = %w{--colour}
    t.pattern = 'spec/**/*_spec.rb'
    t.rcov = true
    t.rcov_opts = ['--rails', '--exclude', 'spec,.rvm,spec/factories']
  end
end
