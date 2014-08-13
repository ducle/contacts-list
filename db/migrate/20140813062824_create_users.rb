class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string      :name
      t.string      :slug, unique: true, index: true
      t.string      :friends, array: true, default: []
      t.timestamps
    end
  end
end
