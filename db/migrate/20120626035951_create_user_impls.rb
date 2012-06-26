class CreateUserImpls < ActiveRecord::Migration
  def self.up
    create_table :user_impls do |t|
	t.column :user_id, :integer
	t.column :fname, :string
	t.column :lname, :string
      t.timestamps
    end
  end
def self.down
drop_table :user_impls
end

end
