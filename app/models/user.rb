class User < ApplicationRecord
  has_one_attached :profile_photo do |attachable|
    attachable.variant :thumb, resize_to_limit: [100, 100]
  end

  # has_one_base64_attached :avatar do |attachable|
  #   attachable.variant(:thumb, resize_to_limit: [100, 100])
  # end
end
