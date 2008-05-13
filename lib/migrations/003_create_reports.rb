class CreateReports < Sequel::Migration
  def up
    create_table :reports do
      primary_key :id
      integer :client_id
      datetime :occurred_at
      text :report
    end
  end
  def down
    drop_table :reports
  end
end
