require 'spree_core'
require 'spree_product_ordering_hooks'

module SpreeProductOrdering
  class Engine < Rails::Engine

    config.autoload_paths += %W(#{config.root}/lib)

    def self.activate
   
		Product.class_eval do
			acts_as_list
			default_scope :order => "position"
			named_scope :ordered, :order => 'position'
        end
		
	Admin::ProductsController.class_eval do
          
      def reorder
        @products = Product.active.find(:all, :order => 'position')
      end
      
      def order_products
        
        params[:item_list].each_with_index do |id, index|
            Product.update_all(['position=?', index+1], ['id=?', id])
        end

          respond_to do |format|
            format.js do 
              render :update do |page|
                page.visual_effect :highlight, "item_list"
              end
            end
		  end  
      end 
    end
    end
    
    config.to_prepare &method(:activate).to_proc
  end
end
