class Category < ActiveRecord::Base
	validates :name, presence: true
	has_many :has_categories
	has_many :photo, through: :categorias
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
end