class HasCategory < ActiveRecord::Base
  belongs_to :photo
  belongs_to :category

  
end