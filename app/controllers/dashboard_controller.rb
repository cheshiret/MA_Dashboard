class DashboardController < ApplicationController
  def home
    @dashsubquery = Dashboard::Dashboard.select("*")
    @dashsubquery = @dashsubquery.order("date desc")
    @dashboard = Dashboard::Dashboard.select("env, build_version, db, status, date")
    .from("(#{@dashsubquery.to_sql}) as temp")
    .group("env")
    .order("date asc")
    #  @list = ReportDashboard.select("casename") #.where(id: 10)
    #   @list_count = @list.count
    #   @subquery = TestResult.select("*")
    #   @subquery = @subquery.order("create_date desc")
    #   @testresult = TestResult.select("case_id, case_name, machine, awo_version, test_result")
    #                     .from("(#{@subquery.to_sql}) as temp")
    #                     .where("case_name".match("%migrauto%")).group("case_name")
    #                     .order("create_date desc")
  end

  def graph()
#    @testenv=dash_params[:testenv]
    @subquery = Dashboard::TestResult.select("*")
    @subquery = @subquery.order("create_date desc")
    @testresult = Dashboard::TestResult.select("case_id, substring(case_name,57) as casename, awo_version,
                        upper(left(contract,2)) as contract, create_date,
                        if(ifnull(test_result, 1)=2, 'Pass', 'Fail') as test_result")
                      .from("(#{@subquery.to_sql}) as temp")
                      .where("awo_version like '%lvmig%' AND case_id <> 0")
                      .group("case_name")
                      .order("awo_version, create_date desc")
  end

  def testcase
    @list = Dashboard::TestCase.select("id, substring(casename,32) as casename, timing")
                .where("test_set='sanity' AND casename not like '%draft%' AND casename not like '%batch%'")
                .order("casename asc")
    @list_count = @list.count(:id)
  end

  def simplegraph

  end

  def dash_params
#    params.require(:graph).permit(:id, :testenv)
  end

  def pagetiming
    @subquery = Dashboard::PageTiming.select("*")
                    .where("recorddate > '2016-01-01 00:00:00'")
                    .order("recorddate desc")
    # @subquery=@subquery
    @result = Dashboard::PageTiming.select("pagename, loadingtime, buildversion,
                  max(recorddate) as latestrecorddate, env,
                  substring(testcasename, 57) as casename")
                  .from("(#{@subquery.to_sql}) as temp")
                  .where("loadingtime > 20 AND testcasename not like '%draft%' AND testcasename not like '%batch%'")
                  .group("pagename, env, buildversion")
                  .order("pagename, buildversion, loadingtime desc")
  end

  def qalib
    @qalib = Dashboard::QALib.none
    if params[:search]
      @qalib = Dashboard::QALib.search(params[:search]).order("cb_class, cb_id")
    else
      @qalib = Dashboard::QALib.none
    end

  end


end

