require 'spree_core'

module Spree
  module ProductOrdering
    class Engine < Rails::Engine
      isolate_namespace Spree
      engine_name 'spree_product_ordering'

      config.autoload_paths += %W(#{config.root}/lib)

      # use rspec for tests
      config.generators do |g|
        g.test_framework :rspec
      end

      config.to_prepare do
        # Load extensions
        Dir.glob(File.join(File.dirname(__FILE__), "../../../app/extensions/**/*.rb")) do |c|
          Rails.configuration.cache_classes ? require(c) : load(c)
        end
      end


      def self.activate
        Dir.glob(File.join(File.dirname(__FILE__), '../../../app/**/*_decorator*.rb')) do |c|
          Rails.configuration.cache_classes ? require(c) : load(c)
        end

        Spree::Config.searcher_class = Spree::ProductOrdering::Search
      end

      config.to_prepare &method(:activate).to_proc
    end
  end
end