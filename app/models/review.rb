class Review < ActiveRecord::Base
	belongs_to :user, dependent: :destroy
	belongs_to :place
end
