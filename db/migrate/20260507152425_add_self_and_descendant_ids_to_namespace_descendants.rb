class AddSelfAndDescendantIdsToNamespaceDescendants < ActiveRecord::Migration[8.0]
  def change
    add_column :namespace_descendants, :self_and_descendant_ids, 'bigint[]', default: [], null: false
  end
end
