module Paranoic
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path("../templates", __FILE__)

    def create_initializer_setup_file
      template "paranoic.rb", "config/initializers/paranoic.rb"
    end

  end
end
