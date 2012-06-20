# -*- encoding : utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "serving search form by a controller that doesn't handle search" do
  # Testing the case where an app has the search form in the header of the 
  # document.  This request is served by a controller that does not include 
  # Blacklight::Catalog. The path to submit the search form to must be 
  # provided to the partial as a local variable.

  it "should have the correct action on the form" do
    visit header_search_path
    page.should have_selector("form[action='#{catalog_index_path}']")
  end

end
