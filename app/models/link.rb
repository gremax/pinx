class Link < ActiveRecord::Base
  validates :url, presence: true, url: true
  acts_as_taggable
  belongs_to :user
end
