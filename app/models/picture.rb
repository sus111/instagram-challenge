class Picture < ApplicationRecord
  has_many :comments,
           -> { extending WithUserAssociationExtension },
           dependent: :destroy
  belongs_to :user, -> { extending WithUserAssociationExtension }
  has_many :likes, dependent: :destroy

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>", :large => "500x500" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

end
