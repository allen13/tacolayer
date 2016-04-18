class CreateTacos < ActiveRecord::Migration
  def change
    create_table :tacos do |t|
      t.string :title
      t.string :url

      t.timestamps null: false
    end
  end
end
