class AddManySHits < ActiveRecord::Migration[5.1]
  def change
    add_column :calendars, :image, :string
    add_column :events, :image, :string
    rename_column :calendars, :user_id, :owner_id
  end
end
