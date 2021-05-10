class CreateAis < ActiveRecord::Migration[6.0]
  def change
    create_table :ais do |t|
      t.string :name
      t.float :weight
      t.datetime :factory_date

      t.timestamps
    end
  end
end
