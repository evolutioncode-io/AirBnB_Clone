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

    def stripe_express_path
        "https://connect.stripe.com/express/oauth/authorize?redirect_uri=https://connect.stripe.com/hosted/oauth&client_id=ca_I4kU9IWrhDOIMOGlsRmUPIddpfzNQ4Qo&state=onbrd_I4l0Kv3OrMf5EoxONQR8gKimud&stripe_user[country]=MX"
    end
end
