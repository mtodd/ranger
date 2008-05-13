class CreateClients < Sequel::Migration
  def up
    create_table :clients do
      primary_key :id
      varchar :name, :size => 32
      integer :account_id, :null => false
      varchar :key, :key => 32
      datetime :created_at
      datetime :updated_at
    end
  end
  def down
    drop_table :clients
  end
end
