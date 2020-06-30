module ApplicationHelper
    
    def avatar_url(user)
        #Load the facebook image
        if user.image
            "https://graph.facebook.com/v2.6/#{user.uid}/picture?type=small"
            
        else
            #Load the gravatar image
            gravatar_id = Digest::MD5::hexdigest(user.email).downcase
            "https://www.gravatar.com/avatar/#{gravatar_id}.jpg?d=identical&s=150"
        end
    end
end
