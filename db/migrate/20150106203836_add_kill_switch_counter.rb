class AddKillSwitchCounter < ActiveRecord::Migration
  def change
  	add_column :flats, :killswitch, :integer
  end
end
