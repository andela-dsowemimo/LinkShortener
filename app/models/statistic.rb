class Statistic < ActiveRecord::Base
  belongs_to :link
  serialize :browser
  serialize :users
end
