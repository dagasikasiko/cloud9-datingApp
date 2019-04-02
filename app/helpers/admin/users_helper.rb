module Admin::UsersHelper
    def admin_image_for(user)
    # p "|||||||||||||||||"
    # p user.image? 

        if user.image? 
            image_tag user.image.url, :size => "100x100"

        else
            image_tag "icon.png", :size => "100x100"

        end
     end
     
     
     def note_image_for(user)
    # p "|||||||||||||||||"
    # p user.image? 

        if user.image? 
            image_tag user.image.url, :size => "300x300"

        else
            image_tag "icon.png", :size => "300x300"

        end
     end
end
