module Spree
  module ProductOrdering
    class Search < Spree::Core::Search::Base
      protected
        def get_base_scope
          super.by_position
        end
    end
  end
end
