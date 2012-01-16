Admin::TaxonsController.class_eval do
  def available
    if params[:q].blank?
      @available_taxons = []
    else
      @available_taxons = Taxon.find(:all, :conditions => ['lower(name) LIKE ?', "%#{params[:q].downcase}%"])
    end
    @available_taxons.delete_if { |taxon| @product.taxons.include?(taxon) } if @product
    respond_to do |format|
      format.html
      format.js {render :layout => false}
    end
  end

  def taxons_list
    if params[:q].blank?
      @taxons = []
    else
      @taxons = Taxon.find(:all, :conditions => ['lower(name) LIKE ?', "%#{params[:q].downcase}%"])
    end
    respond_to do |format|
      format.html
      format.js {render :layout => false}
    end
  end
end
