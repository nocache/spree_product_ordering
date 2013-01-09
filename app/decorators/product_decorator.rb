if Product.table_exists?
  Product.class_eval do
    acts_as_list
    default_scope :order => "products.position"
    named_scope :ordered, :order => 'products.position'
  end
end
