require 'rest-client'
require 'json'

URL = Rails.application.credentials.dig(:fake_store_api, :api_url)
response = RestClient.get("#{URL}?limit=10")
parsed_response = JSON.parse(response)
parsed_response.each do |product|
  Product.create({name: product['title'], 
                description: product['description'], 
                price: product['price'], 
                category: product['category'], 
                image: product['image'], 
                rating: product['rating']['rate']})
end