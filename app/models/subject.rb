class Subject < ActiveRecord::Base
    has_many :pages
    scope :visible, -> {where(:visible => true)}
    scope :invisible, -> {where(:postion => false)}
    scope :sorted, -> {order("position ASC")}
    scope :newest_first, -> {order("created_at DESC")}
    # scope :search, -> {|query| where(["name LIKE ?", "%#{query}%"])}
    validates_presence_of :name
    
end
