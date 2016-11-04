class AWOConfigurationController < ApplicationController
  # add contract as param later
  def index

  end
  def view
    @result=Awoconfiguration.all.select("desc,name")#.from("D_LOC")
  end
  def syst_1
    #@result=Configuration.select("desc,name").from("D_LOC")
  end
end