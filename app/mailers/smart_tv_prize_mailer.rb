class SmartTvPrizeMailer < ApplicationMailer
  default from: "plaza.app.helper@gmail.com"

  def smart_tv_prize product, user
    @user = user
    @product = product
    @product_url = product.image_url(field: "image")
    mail(to: @user.email, subject: "Gracias por ser parte de nosotros")
  end
end
