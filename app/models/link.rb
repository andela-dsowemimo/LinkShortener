class Link < ActiveRecord::Base
  before_save :create_statistic
  VALID_URL_REGEX = /((http|https)\:\/\/)?[a-zA-Z0-9\.\/\?\:@\-_=#]+\.([a-zA-Z0-9\.\/\?\:@\-_=#])*/
  validates :full_link_address, format: {with: VALID_URL_REGEX }
  belongs_to :user
  has_one :statistic
  scope :most_recent, -> {order("created_at desc")}
  scope :most_popular, -> {order("visits desc")}

  def create_statistic
    self.statistic ||= Statistic.new
    self.statistic.browser ||= Hash.new(0)
    self.statistic.users ||= Hash.new(0)
    self.statistic.save
  end

  def get_browser_count(browser_name)
    self.statistic.browser[browser_name] = 0 unless self.statistic.browser[browser_name]
    self.statistic.browser[browser_name] += 1
    self.statistic.save
  end

  def get_user_count(user_name)
    self.statistic.users[user_name] = 0 unless self.statistic.users[user_name]
    self.statistic.users[user_name] += 1
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
