class ProductsApi < Grape::API
  resources :products do
    params do
      optional :page, type: Integer, default: 1
      optional :per, type: Integer, default: 1
      optional :q, type: Hash
    end
    get do
      @q = Product.ransack(params[:q])
      @products = @q.result
      @products = @products.page(params[:page]).per(params[:per])
      #@products.map{|product| ProductSerializer.new(product)}

      present @products , with: ProductEntity,email_send: true
    end


    params do

    end
    post do
      requires :product, type: Hash do
        requires :name, type: String
        requires :price, type: Integer
      end
    end

  end
end