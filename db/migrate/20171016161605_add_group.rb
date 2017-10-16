class AddGroup < ActiveRecord::Migration[5.1]
  def change
    create_table :groups do |t|
      t.string :title, null: false
      t.references :owner
    end
  end
end
