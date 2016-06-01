class Episode < ActiveRecord::Base
  belongs_to :user


  has_attached_file :episode_thumbnail, styles: { large: "1000x1000#", thumb: "550x550#" }
  validates_attachment_content_type :episode_thumbnail, content_type: /\Aimage\/.*\Z/
end
