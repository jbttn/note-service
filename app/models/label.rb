class Label < ActiveRecord::Base
  belongs_to :owner, class_name: 'User'
  has_many :notes
  
  def to_param
    "#{id}-#{name.parameterize}"
  end
end
