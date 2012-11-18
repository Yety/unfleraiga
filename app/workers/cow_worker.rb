# handle asynchronous mooing.
class CowWorker < Workling::Base 
  def moo(options)
    cow = Cow.find(options[:id])
    logger.info("about to moo.")
    cow.moo
  end
end