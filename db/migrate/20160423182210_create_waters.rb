class CreateWaters < ActiveRecord::Migration
  def change
    create_table :waters do |t|

      t.timestamps null: false
    end
  end
end
