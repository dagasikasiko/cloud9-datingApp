module UsersHelper
  def image_for(user)
    # p "|||||||||||||||||"
    # p user.image? 
    if user.image? 
      if user.favorite_type == 0
      image_tag user.image.url, class: "profile_img"
      elsif user.favorite_type == 1
      image_tag user.image.url, class: "profile_img2"
      elsif user.favorite_type == 2
      image_tag user.image.url, class: "profile_img3"
      elsif user.favorite_type == 3
      image_tag user.image.url, class: "profile_img4"
      elsif user.favorite_type == 4
      image_tag user.image.url, class: "profile_img5"
      end
    else
      if user.favorite_type == 0
      image_tag 'icon.png', class: "profile_img"
      elsif user.favorite_type == 1
      image_tag 'icon.png', class: "profile_img2"
      elsif user.favorite_type == 2
      image_tag 'icon.png', class: "profile_img3"
      elsif user.favorite_type == 3
      image_tag 'icon.png', class: "profile_img4"
      elsif user.favorite_type == 4
      image_tag 'icon.png', class: "profile_img5"
      end
      
    end
    # image_tag 'goroumaru.png', class: "profile_img"
  end
  
  # ガチャ用
  def gacha_image_for(user)
    if user.image? 
      if user.favorite_type == 0
      image_tag user.image.url, class: "gacha_img"
      elsif user.favorite_type == 1
      image_tag user.image.url, class: "gacha_img2"
      elsif user.favorite_type == 2
      image_tag user.image.url, class: "gacha_img3"
      elsif user.favorite_type == 3
      image_tag user.image.url, class: "gacha_img4"
      elsif user.favorite_type == 4
      image_tag user.image.url, class: "gacha_img5"
      end
    else
      if user.favorite_type == 0
      image_tag 'icon.png', class: "gacha_img"
      elsif user.favorite_type == 1
      image_tag 'icon.png', class: "gacha_img2"
      elsif user.favorite_type == 2
      image_tag 'icon.png', class: "gacha_img3"
      elsif user.favorite_type == 3
      image_tag 'icon.png', class: "gacha_img4"
      elsif user.favorite_type == 4
      image_tag 'icon.png', class: "gacha_img5"
      end
      
    end
    # image_tag 'goroumaru.png', class: "profile_img"
  end
  
  
end

