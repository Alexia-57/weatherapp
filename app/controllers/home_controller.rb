class HomeController < ApplicationController
  def index
    require 'net/http'
    require 'json'
    @url = 'https://www.airnowapi.org/aq/observation/zipCode/current/?format=application/json&zipCode=89129&distance=0&API_KEY=10EFB85D-F8B3-47CB-ADDE-9F3226663E76'
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @output = JSON.parse(@response)

    #check for empty return results
    if @output.empty?
      @final_output = "Error"
    elsif !@output
      @final_output = "Error"
    else
      @final_output = @output[0]['AQI']
    end

    if  @final_output == "Error"
        @api_color = "silver"
    elsif @final_output <= 50
        @api_color = "green"
        @api_description ="The air quality is good (0 - 50)"
    elsif @final_output >= 51 && @final_output <=100
        @api_color = "yellow"
        @api_description ="The air quality is moderate (51 - 100)"
    elsif @final_output >= 101 && @final_output <=150
        @api_color = "orange"
        @api_description ="The air quality is unhealthy for Sensitive Groups (USG) (151 - 200)"
    elsif @final_output >= 151 && @final_output <=200
        @api_color = "red"
        @api_description ="The air quality is unhealthy (201 - 300)"
    elsif @final_output >= 201 && @final_output <=300
        @api_color = "purple"
        @api_description ="The air quality is very Unhealthy (301 - 500)"
    elsif @final_output >= 301 && @final_output <=500
        @api_color = "maroon"
        @api_description ="The air quality is hazardous"
    end
  end

  def zipcode
    @something = params[:zipcode]
  end


end
