class CreateTemplates < ActiveRecord::Migration[5.2]
  def change
    create_table :templates do |t|
      t.string :name
      t.text :html
      t.text :css
      t.string :engine
      t.string :mime

      t.timestamps
    end
  end
end
