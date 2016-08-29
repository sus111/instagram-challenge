class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :picture, -> { extending WithUserAssociationExtension }

end
