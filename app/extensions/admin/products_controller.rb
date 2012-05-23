module Spree
  module ProductOrdering
    module Extensions
      module Admin
        module ProductsController
          extend ActiveSupport::Concern

          included do
            def reorder
              @products = Spree::Product.active.find(:all, :order => 'position')
            end

            def update_positions
              params[:positions].each do |id, index|
                Spree::Product.where(:id => id).update_all(:position => index)
              end

              respond_to do |format|
                format.js  { render :text => 'Ok' }
              end
            end
          end
        end
      end
    end
  end
end
::Spree::Admin::ProductsController.send(:include, Spree::ProductOrdering::Extensions::Admin::ProductsController)