namespace :rudy do
  desc 'delete all products'
  task drop_products: :environment do
    product_count = Product.count
    Product.destroy_all
    puts '*****'
    puts "#{product_count} products was deleted"
    puts '*****'
  end
  desc 'test should'
  task test_should: :environment do
    puts 'test_abc'
  end
end
