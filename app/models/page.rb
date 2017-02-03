class Page < ActiveRecord::Base
  belongs_to :subject
  has_many :sections
  has_and_belongs_to_many :admin_users
 
  scope :visible, -> {where(:visible => true)}
  scope :invisible, -> {where(:postion => false)}
  scope :sorted, -> {order("position ASC")}
  scope :newest_first, -> {order("created_at DESC")}
  
  validates_presence_of :name
  validates_length_of :name, :maximum => 255
  validates_presence_of :permalink
  validates_length_of :permalink, :within => 3..255
  # use presence_of with length_of to disallow spaces
  validates_uniqueness_of :permalink
  # for unique values by subject use ":scope => :subject_id"

end
