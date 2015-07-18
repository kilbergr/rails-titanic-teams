class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :password_digest
      t.boolean :is_admin, :default => false
      t.boolean :super_admin, :default => false

      t.timestamps null: false
    end
  end
end
