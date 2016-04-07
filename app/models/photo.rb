  class Photo < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :comments, dependent: :destroy
  has_many :has_categories
  has_many :categories, through: :has_categories
  has_many :likes, dependent: :destroy
  has_attached_file :image,
    :styles => { :original => "600x600>" },
    :storage => :dropbox,
    :dropbox_credentials => { app_key: "c44rype52pr2ps9",
                              app_secret:"2ma64335qa4h3ic",
                              access_token: "xob1w1et96cy09u6",
                              access_token_secret: "3336gs1wspfqcrd",
                              user_id:"280939188",
                              access_type: 'app_folder'}
                              
  validates_attachment_content_type :image, :content_type => /\Aimage/

  # Validate filename
  validates :image, presence: true
  validates :user_id, presence: true
  default_scope -> { order(updated_at: :desc) }
  after_create :save_categories
  def categories=(value)
    @categories = value
  end

  def save_categories
    unless @categories.nil?   
      @categories.each do |category_id|
        HasCategory.create(category_id: category_id, photo_id: self.id)
      end
    end
  end
  def thumbs_up_total
    self.likes.where(like: true).size
  end

  def thumbs_down_total
    self.likes.where(like: false).size
  end
end
