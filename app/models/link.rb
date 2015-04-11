class Link < ActiveRecord::Base
  strip_attributes
  validates :url, presence: true, url: true
  acts_as_taggable
  belongs_to :user

  private
end
