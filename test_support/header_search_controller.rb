# -*- encoding : utf-8 -*-
class HeaderSearchController < ApplicationController  

# This controller acts as an example for testing the case where an app has 
# the search form in the header of the document.  This request is served 
# by a controller other than the CatalogController, so the path to run the
# search must be provided to the partial as a local variable.

  def sample
    render :partial=>"/catalog/search_form", :locals=>{:search_url=>catalog_index_path}
  end


end 
