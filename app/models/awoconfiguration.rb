class Awoconfiguration < ActiveRecord::Base
  establish_connection :qa5_db
  self.table_name = 'live_ks.d_loc'
end