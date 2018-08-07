class Deleteinstallstable < ActiveRecord::Migration[5.2]
  def change
  	drop_table :installs
  end
end
