class Link < ActiveRecord::Base
  belongs_to :user
  paginates_per 1
  scope :recent_sort, -> {order("created_at desc")}
end
