class User < ActiveRecord::Base
  attr_accessible :email,
                  :first_name,
                  :last_name,
                  :password,
                  :password_confirmation,
                  :picture_path,
                  :username,
                  :profile_photo

  has_secure_password
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email

  mount_uploader :profile_photo, ProfilePhotoUploader

  after_create :take_profile_photo

  def take_profile_photo
    file = Tempfile.new(["template_#{self.id.to_s}", 'jpg'], 'tmp', :encoding => 'ascii-8bit')
    #require 'debugger'
    #debugger
    file.write(IMGKit.new(self.profile_photo, quality: 50, width: 600).to_jpg)
    self.profile_photo = file
    file.unlink
    self.save
  end

  before_create { generate_token(:auth_token) }

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end
end
