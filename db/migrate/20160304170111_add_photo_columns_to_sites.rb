class AddPhotoColumnsToSites < ActiveRecord::Migration
  def change
    add_attachment :sites, :url_image
  end
end
