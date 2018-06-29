class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.references :user
      t.string :document
      t.string :status
      t.references :template
      t.text :data

      t.timestamps
    end
  end
end
