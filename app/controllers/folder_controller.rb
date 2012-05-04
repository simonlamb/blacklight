# -*- encoding : utf-8 -*-
class FolderController < ApplicationController
  include Blacklight::Configurable
  include Blacklight::SolrHelper

  copy_blacklight_config_from(CatalogController)

  helper CatalogHelper

  # fetch the documents that match the ids in the folder
  def index
    @response, @documents = get_solr_response_for_field_values("id",Bookmark.find_all_by_session_id(request.session_options[:id]).map { |x| x.document_id })
  end
    

  # add a document_id to the folder. :id of action is solr doc id 
  def update
    b = Bookmark.new :document_id => params[:id]
    b.session_id = request.session_options[:id]
    b.save
    # Rails 3 uses a one line notation for setting the flash notice.
    #    flash[:notice] = "#{params[:title] || "Item"} successfully added to Folder"
    respond_to do |format|
      format.html { redirect_to :back, :notice =>  I18n.t('folder.add.success', :title => params[:title] || 'Item') }
      format.js { render :json => Bookmark.find_all_by_session_id(request.session_options[:id]) }
    end
  end
 
  # remove a document_id from the folder. :id of action is solr_doc_id
  def destroy
    Bookmark.find_by_session_id_and_document_id(request.session_options[:id], params[:id]).delete

    respond_to do |format|
      format.html do
        flash[:notice] = I18n.t('folder.remove.success', :title => params[:title] || 'Item')
        redirect_to :back
      end
      format.js do
        render :json => {"OK" => "OK"}
      end
    end
          
  end
 
  # get rid of the items in the folder
  def clear
    flash[:notice] = I18n.t('folder.clear.success')
    Bookmark.where(:session_id => request.session_options[:id]).delete_all
    respond_to do |format|
      format.html { redirect_to :back }
      format.js { render :json => [] }
    end
  end
 
end
