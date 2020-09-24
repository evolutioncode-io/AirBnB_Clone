class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :omniauthable

  validates :fullname, presence: true, length: {maximum: 50}
  
  #One user can have many rooms
  has_many :rooms
  has_many :reservations

  #Reviews for reservations
  has_many :guest_reviews, class_name: "GuestReview", foreign_key: "guest_id"
  has_many :host_reviews, class_name: "HostReview", foreign_key: "host_id"

  #This method tries to find an existing user by the provider and uid fields. If no user is found, 
  #a new one is created with a random password and some extra information
  def self.from_omniauth(auth)
    user = User.where(email: auth.info.email).first

    if user
      return user
    else
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.fullname = auth.info.name   # assuming the user model has a name
      user.image = auth.info.image # assuming the user model has an image
      user.uid = auth.uid
      user.provider = auth.provider
      # If you are using confirmable and the provider(s) you use validate emails, 
      # uncomment the line below to skip the confirmation emails.
      user.skip_confirmation!
      end
    end
  end

  #To sms with the gem twilio
  def generate_pin
    #Random pin
    self.pin = SecureRandom.hex(2)
    self.phone_verified = false
    save
  end

  def send_pin
    # set up a client to talk to the Twilio REST API
    @client = Twilio::REST::Client.new
    #Send an SMS
    @client.messages.create(
      from: '+14252742501',
      to: self.phone_number,
      body: "Your pin is #{self.pin}"
    )
  end

  def verify_pin(entered_pin)
    update(phone_verified: true) if self.pin == entered_pin
  end

  #Stripe
  def is_active_host
    !self.merchant_id.blank?
  end
end
