json.products @products do |product|
    json.partial! 'api/v1/view/products/product', product: product
    json.promotions product.get_promotions do |promotion|
        json.partial! 'api/v1/view/promotions/promotion', promotion: promotion
    end
end
