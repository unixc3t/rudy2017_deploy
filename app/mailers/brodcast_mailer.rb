class BrodcastMailer < ApplicationMailer
  def new_product(product, user)
    @user = user
    @product = product
    mail(
      subject: product.name,
      to: @user.email
    )
  end
end
