class CreateCiPipelineSchedules < ActiveRecord::Migration[8.0]
  def change
    create_table :ci_pipeline_schedules do |t|
      t.string :description
      t.string :ref
      t.string :cron
      t.string :cron_timezone
      t.datetime :next_run_at
      t.bigint :project_id, null: false
      t.bigint :owner_id
      t.boolean :active, default: true
      t.timestamps
    end

    add_index :ci_pipeline_schedules, [:next_run_at, :active]
    add_index :ci_pipeline_schedules, :owner_id
    add_index :ci_pipeline_schedules, :project_id
  end
end
