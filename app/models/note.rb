class Note < ActiveRecord::Base
  belongs_to :owner, class_name: 'User'
  belongs_to :label
  before_validation :init
  
  scope :recent, order('created_at DESC')
  scope :unlabeled, where('label_id is NULL')
  
  self.per_page = 5
  
  def increment_hits
    self.increment!(:hits)
  end
  
  private
  
    def init
      self.hits = 0
    end
end
