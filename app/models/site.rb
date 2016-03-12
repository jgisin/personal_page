class Site < ActiveRecord::Base
  has_attached_file :url_image, :styles => { :preview => "650x500", :thumb => "500x300"}, :s3_host_name => 's3-us-west-2.amazonaws.com'

  validates_attachment_content_type :url_image, :content_type => /\Aimage\/.*\Z/
end
