class CreateActions < ActiveRecord::Migration
  def change
    create_table :actions do |t|
      t.text :description
      t.datetime :scheduled_for
      t.integer :assigned_to
      t.integer :user_id
      t.integer :project_id
      t.integer :area_id

      t.timestamps
    end
  end
end
