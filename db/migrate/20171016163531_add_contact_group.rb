class AddContactGroup < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts_groups do |t|
      t.references :contact
      t.references :group
    end
  end
end
