class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.string :name, null: false # 部屋名なしはNG
      t.timestamps
    end
  end
end