
json.data do
  json.partial! '/api/v1/products/product', collection: @products, as: :product
end  