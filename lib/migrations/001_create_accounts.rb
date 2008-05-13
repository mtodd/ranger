class CreateAccounts < Sequel::Migration
  def up
    create_table :accounts do
      primary_key :id
      varchar :username, :size => 32, :unique => true
      varchar :password, :size => 32
      varchar :email
      datetime :created_at
    end
  end
  def down
    drop_table :accounts
  end
end
