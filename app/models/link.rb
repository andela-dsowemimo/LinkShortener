class Link < ActiveRecord::Base
  belongs_to :user
  scope :recent_sort, -> {order("created_at desc")}
end
