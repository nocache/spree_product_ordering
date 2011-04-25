Product.class_eval do
  acts_as_list
  default_scope :order => "position"
  named_scope :ordered, :order => 'position'
end