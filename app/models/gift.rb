class Gift < ActiveRecord::Base

  has_attached_file :image,
                    :styles => { :medium => '300x300>', :thumb => '100x100>' },
                    :default_url => '/images/:style/missing.png'

  validates_attachment :image,
                       :presence => true,
                       :content_type => { :content_type => %w{image/gif image/png image/jpg image/jpeg} },
                       :size => { :in => 0..2.megabytes }

end
