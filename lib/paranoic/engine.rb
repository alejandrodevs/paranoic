$:.push File.expand_path("../../../lib", __FILE__)

require "haml-rails"
require 'paranoic/setup'

module Paranoic
  extend Setup

  class Engine < ::Rails::Engine
    isolate_namespace Paranoic

    config.generators do |g|
      g.template_engine :haml
      g.test_framework :rspec, :fixture => false
      g.javascript_engine :coffee
      g.stylesheet_engine :scss
      g.integration_tool :rspec
      g.helper false
    end
  end
end
