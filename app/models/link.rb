class Link < ActiveRecord::Base
  belongs_to :user
  scope :recent_sort, -> {order("created_at desc")}

  @browser_history = Hash.new 0

  def get_browser
    @browser_history[browser.name] += 1
  end

  def increment_visits
    self.visits +=1
    self.save
  end
end
