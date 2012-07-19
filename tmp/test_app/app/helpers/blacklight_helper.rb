module BlacklightHelper
  include Blacklight::BlacklightHelperBehavior

 # collection of items to be rendered in the @topbar
  def topbar_items
    @topbar_items ||= []
  end

 # collection of items to be rendered in the @searchbar 
  def search_bar
    @search_bar ||= []
  end


end
