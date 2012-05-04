class AddSessionToBookmarks < ActiveRecord::Migration
  def self.up

    add_column :bookmarks, :session_id, :string
    change_column :bookmarks, :user_id, :integer, :null => true
    add_index :bookmarks, :session_id
    add_index :bookmarks, :user_id

  end

  def self.down
    remove_column :bookmarks, :session_id
    remove_index :bookmarks, :session_id
    remove_index :bookmarks, :user_id
  end
end
