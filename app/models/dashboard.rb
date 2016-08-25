module Dashboard
  class Dashboard < ActiveRecord::Base
    establish_connection :development
    self.table_name = 'app_status'
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

  class SimpleGraph < ActiveRecord::Base
    establish_connection :development
    self.table_name = 'awo_sessions'
    self.primary_key = 'id'
  end

  class PageTiming < ActiveRecord::Base

    establish_connection :development
    self.table_name = 'page_timing'
    # belongs_to :testcase
    # :foreign_key => "case_id"
  end

  class QALib < ActiveRecord::Base
    establish_connection :development
    self.table_name = 'code_base_lib'

    def self.search(search)
      where("cb_base_class LIKE ?","%#{search}%")
    end
  end
end
