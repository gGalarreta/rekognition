json.user_promotions @user_promotions do |user_promotion|
    json.promotion_id user_promotion.promotion_id
    json.value user_promotion.value
    json.product_name user_promotion.name
    json.image_file_name user_promotion.image_file_name
    json.image_content_type user_promotion.image_content_type
    json.image_file_size user_promotion.image_file_size
    json.price user_promotion.price
end
