class DashboardController < ApplicationController


  def home
    @list = ReportDashboard.select("casename") #.where(id: 10)
    @list_count = @list.count
    @subquery = TestResult.select("*")
    @subquery = @subquery.order("create_date desc")
    @testresult = TestResult.select("case_id, case_name, machine, awo_version, test_result")
                      .from("(#{@subquery.to_sql}) as temp")
                      .where("case_name".match("%migrauto%")).group("case_name")
                      .order("create_date desc")
  end

  def testcase
    @caselist = @list
    @count = @list_count
  end

  def graph
    @list = ReportDashboard.select("casename").where(id: 10)
    @list_count = @list.count
  end
end

