require 'open-uri'
require 'json'


class Job < ActiveRecord::Base
  attr_accessible :color, :name, :jenkins
  
  def job_color
    if(!jenkins)
      return " "
    end
    url_with_api_string = jenkins + "api/json"
    to_be_returned = ""
    result = JSON.parse(open(url_with_api_string).read)
    if result["color"].respond_to?(:each)
      result["color"].each do |build|
	to_be_returned  << build.inspect << "<br>"
      end
    else
      to_be_returned = result["color"]
    end
    
    return to_be_returned
  end
end
