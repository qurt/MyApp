class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :project_id
      t.integer :owner_id
      t.integer :performer_id
      t.string :title
      t.text :content
      t.boolean :active
      t.datetime :publish

      t.timestamps
    end
  end
end
