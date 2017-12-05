json.products do
  json.array! @products, partial: 'product',as: :ppppt
end

json.current_page @products.current_page
json.total_count @products.total_pages
json.is_last_page @products.last_page?
json.limit_value @products.limit_value
