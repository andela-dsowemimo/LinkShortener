class Link < ActiveRecord::Base
  belongs_to :user
  scope :recent_sort, -> {order("created_at desc")}

  def increment_visits
    self.visits +=1
    self.save
  end
end
