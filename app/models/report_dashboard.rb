class ReportDashboard < ActiveRecord::Base
  establish_connection :development
  self.table_name = 'test_cases'
  self.primary_key = 'id'

  #establish_connection("eic")
  #default_scope -> { where flag: 1 }
  #def readonly?
  #  true
  #end
  #belongs_to :productbase, :primary_key => "prod_id", :foreign_key => "productname"
end

class TestCases < ActiveRecord::Base
  establish_connection :development
  self.table_name = 'test_cases'
  self.primary_key='id'
end

class TestResult < ActiveRecord::Base
  self.table_name = 'awo_sessions'
  self.primary_key = 'id'
 # :foreign_key => "case_id"
end
