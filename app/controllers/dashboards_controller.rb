class DashboardsController < ApplicationController
  def index
    render({ :template => "templates/index.html.erb" })
  end

  def forex
    @api_symbols = "https://api.exchangerate.host/symbols"
    require("open-uri") #in order for open to apply for internet
    require "json"
    raw_data = URI.open(@api_symbols).read
    parsed_data = JSON.parse(raw_data)
    symbols = parsed_data.fetch("symbols")
    @symbols_array = symbols.keys
    render({ :template => "templates/forex.html.erb" })
  end

  def currency_pairs
    @api_symbols = "https://api.exchangerate.host/symbols"
    require("open-uri") #in order for open to apply for internet
    require "json"
    raw_data = URI.open(@api_symbols).read
    parsed_data = JSON.parse(raw_data)
    symbols = parsed_data.fetch("symbols")
    @symbols_array = symbols.keys
    @first_pair = params.fetch("first_pair")
    render({ :template => "templates/currency_pairs.html.erb" })
  end

  def results
    @first_pair = params.fetch("first_pair")
    @second_pair = params.fetch("second_pair")
  end
end
