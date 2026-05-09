class CreateOrganizations < ActiveRecord::Migration[8.0]
  def change
    create_table :organizations do |t|
      t.timestamps null: false
      t.text :name, null: false, default: ''
      t.text :path, null: false
      t.integer :visibility_level, limit: 2, null: false, default: 0
      t.integer :state, limit: 2, null: false, default: 0
    end

    add_index :organizations, :state
    add_index :organizations, 'lower(path)', unique: true
    add_index :organizations, :name
    add_index :organizations, :path
  end
end
