class CreateActivities < ActiveRecord::Migration[5.0]
  def change
    create_table :activities do |t|
      t.column :name, :string
      t.column :calories, :integer
      t.column :user_id, :integer

      t.timestamps
    end
  end
end
