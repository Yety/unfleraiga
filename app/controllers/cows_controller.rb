class CowsController < ApplicationController

  # milking has the side effect of causing
  # the cow to moo. we don't want to
  # wait for this while milking, though,
  # it would be a terrible waste ouf our time.
  def milk
   
    CowWorker.asynch_moo(:id => 1)
  end
  
  def show
    milk
    render :text => "Moo!"
  end
end