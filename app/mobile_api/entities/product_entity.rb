class ProductEntity < Grape::Entity
  expose :id, :name, :price, :type
  expose :email_send do |product, options|
    product.id
  end

  def type
    object.type&.to_s
  end

end