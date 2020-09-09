class User < ApplicationRecord
  
  include ImageHelper
  include DateHelper
  include FaceRecognition

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :sessions, dependent: :destroy
  has_many :incidents, dependent: :destroy
  has_many :preference_store_categories
  has_many :store_categories, through: :preference_store_categories
  has_many :favorite_stores
  has_many :stores, through: :favorite_stores
  has_many :roulettes
  has_many :smart_tv_sponsors, through: :roulettes
  has_many :favorite_products
  has_many :products, through: :favorite_products
  belongs_to :level, required: false
  has_many :user_points_menus
  has_many :points_menus, through: :user_points_menus
  has_one :role, required: false



    # This method associates the attribute ":avatar" with a file attachment
  #has_attached_file :avatar, styles: {
  #  thumb: '100x100>',
  #  square: '200x200#',
  #  medium: '300x300>'
  #}
  has_attached_file :avatar, :path => ":basename.:extension"
 # Validate the attached avatar is avatar/jpg, avatar/png, etc
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  def self.face_recognition avatar
    file_name = avatar.original_filename
    default_user = User.find_by(email: "recognition.default@pucp.pe")
    default_user.update(avatar: avatar)
    aws_avatar_file_name_response = User.recognize_user(file_name)
    current_user = nil
    User.all.each do |user|
      if user.avatar_file_name.present?
        if user.avatar_file_name == aws_avatar_file_name_response
          current_user = user
        end
      end
    end
    current_user

  end

  def handling_image params
    if params.present?
      self.push_image_to_recognition_collection
    end
  end

  def set_avatar params
    if params.present?
      encoded_data = params[:data]
      content_type = params[:content_type]
      image_name = params[:filename]
      image = Paperclip::DataUriAdapter.new("data:#{content_type};base64,#{encoded_data}")
      image.original_filename = image_name
      self.avatar = image
      self.save
    end
  end

  def self.get_level
    self.level
  end

  def full_name
    first_name.to_s + " " + last_name.to_s
  end
 
  def get_user_promotions
    self.level.promotions.joins("LEFT JOIN products ON products.id = promotions.id").select("promotions.*, products.*")
  end

  def handling_gamification
    points_menus_updating = self.previous_changes.keys
    points_menus_changed = self.points_menus.pluck(:name)
    self.points_menus << PointsMenu.where(name: points_menus_updating)
    points_menus_to_be_gained = points_menus_updating - points_menus_changed.uniq
    points_to_be_gained = PointsMenu.where(name: points_menus_to_be_gained).sum(:amount)
  end

  def initialize_user image_params, profile_params
    points_to_be_gained = 0
    profile_params["last_name"] = ""
    if self.update_attributes profile_params
      points_to_be_gained = handling_gamification
      if self.set_avatar image_params
        points_to_be_gained += handling_gamification
        self.handling_image image_params
      end
    end
    self.gamification_points_amount = self.gamification_points_amount.to_i + points_to_be_gained
    self.save
  end

  def self.login_sign_in_wth_fb name, email
    user = User.find_by(email: email)
    unless user
      user = User.create(email: email, password: "pucppass2018", login_with_fb: true, first_name: name)
    else
      user.update(first_name: name)
    end
    user
  end

  def self.login_sign_in_wth_gmail email
    user = User.find_by(email: email)
    unless user
      user = User.create(email: email, password: "pucppass2018", login_with_gmail: true)
    end
    user
  end
  
  def self.find_admins
    users = User.where(role_id: 1)
  end

end