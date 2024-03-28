require 'httparty'
require 'json'

API_KEY = '11a4c589d66ae874f767a3aa'
BASE_URL = 'https://api.exchangerate-api.com/v4/latest/'

def convert_currency(amount, source_currency, target_currency)
  response = HTTParty.get("#{BASE_URL}#{source_currency}")
  data = JSON.parse(response.body)
  exchange_rate = data['rates'][target_currency]
  converted_amount = amount * exchange_rate
  puts "#{amount} #{source_currency} equals #{converted_amount.round(2)} #{target_currency}"
end

# Example from USD to EUR
convert_currency(100, 'USD', 'EUR')
