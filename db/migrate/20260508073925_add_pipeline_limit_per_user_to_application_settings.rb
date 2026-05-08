class AddPipelineLimitPerUserToApplicationSettings < ActiveRecord::Migration[8.0]
  def change
    add_column :application_settings, :pipeline_limit_per_user, :integer, default: 0, null: false
  end
end
