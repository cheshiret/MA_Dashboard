module Dashboard
  class Dashboard < ActiveRecord::Base

  end

  class TestCase < ActiveRecord::Base
    establish_connection :development
    self.table_name = 'test_cases'
    self.primary_key='id'
    # has_many :testresults
  end

  class TestResult < ActiveRecord::Base
    establish_connection :development
    self.table_name = 'awo_sessions'
    self.primary_key = 'id'
    # belongs_to :testcase
    # :foreign_key => "case_id"
  end
end
