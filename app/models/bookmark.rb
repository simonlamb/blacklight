# -*- encoding : utf-8 -*-
class Bookmark < ActiveRecord::Base
  
  belongs_to :user
  validate :at_least_one_user_id_or_session_id

  def at_least_one_user_id_or_session_id 
    if self.user_id.blank? and self.session_id.blank?
      errors.add :user_id,I18n.t('activerecord.errors.messages.blank')
    end
  end

  attr_accessible :id, :document_id, :title
  
end
