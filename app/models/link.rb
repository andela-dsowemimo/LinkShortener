class Link < ActiveRecord::Base
  belongs_to :user
  has_one :statistic
  before_save :create_statistic
  scope :recent_sort, -> {order("created_at desc")}

  def create_statistic
    self.statistic ||= Statistic.new
    self.statistic.browser ||= Hash.new(0)
    self.statistic.save
  end

  def get_browser_count(browser_name)
    self.statistic.browser[browser_name] = 0 unless self.statistic.browser[browser_name]
    self.statistic.browser[browser_name] += 1
    self.statistic.save
  end

  # def get_device_count(browser_platform)
  #   self.statistic.browser[browser_platform] = 0 unless self.statistic.browser[browser_platform]
  #   self.statistic.browser[browser_platform] += 1
  #   self.statistic.save
  # end


  def increment_visits
    self.visits +=1
    self.save
  end
end
