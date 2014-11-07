class Place < ActiveRecord::Base
	geocoded_by :address
	after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }

	belongs_to :user
	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

	has_many :reviews

	  def average
    reviews.map(&:rating).inject(&:+) / reviews.count unless reviews.count == 0
  end

end
