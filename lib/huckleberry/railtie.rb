module Huckleberry
  class Railtie < Rails::Railtie
    railtie_name :huckleberry

    rake_tasks do
      load "huckleberry/tasks/huckleberry.rake"
    end
  end
end
