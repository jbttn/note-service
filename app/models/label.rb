class Label < ActiveRecord::Base
  belongs_to :owner, class_name: 'User'
  has_many :notes
end
