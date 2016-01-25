class DeleteAllAddUsername < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.remove :email, :name
      t.string :username

      User.reset_column_information

      User.all.each do |user|
        user.username = 'N/A'
        user.save
      end

      change_column :users, :username, :string, null: false
    end

    add_index :users, :username, unique: true
  end
end
