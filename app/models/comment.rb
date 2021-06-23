class Comment < ApplicationRecord
  belongs_to :article #用于建立 Active Record 关联。
end
