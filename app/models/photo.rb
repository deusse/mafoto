class Photo < ActiveRecord::Base
  attr_accessible :group_id, :name, :user_id, :picture
  belongs_to :group
  belongs_to :user
  has_many :comments

  has_attached_file :picture,
  	:styles => { :medium => "300x300>", :thumb => "100x100>" },
  	:storage => :dropbox,
  	:dropbox_credentials => "#{Rails.root}/config/dropbox_config.yml",
  	:dropbox_options => {       
		:path => proc { |style| "#{style}/#{id}_#{picture.original_filename}"}, :unique_filename => true   
 	}

 	validates :picture, :attachment_presence => true,
 		:content_type => { :content_type => ["image/jpg", "image/png", "image/gif"] },
  		:size => { :in => 0..2.megabytes }
 	validates :name, :presence => true
end
