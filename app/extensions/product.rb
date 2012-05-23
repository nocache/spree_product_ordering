module Spree
  module ProductOrdering
    module Extensions
      module Product
        extend ActiveSupport::Concern

        included do
          acts_as_list

          scope :by_position, :order => 'spree_products.position'
        end
      end
    end
  end
end
::Spree::Product.send(:include, Spree::ProductOrdering::Extensions::Product)
