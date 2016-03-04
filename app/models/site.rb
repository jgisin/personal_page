class Site < ActiveRecord::Base
  has_attached_file :url_image, :styles => { :preview => "650x500", :thumb => "500x300"}

  validates_attachment_content_type :url_image, :content_type => /\Aimage\/.*\Z/
end
