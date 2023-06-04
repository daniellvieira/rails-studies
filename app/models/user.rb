class User < ApplicationRecord
  encrypts :email

  has_rich_text :description, encrypted: true
end
