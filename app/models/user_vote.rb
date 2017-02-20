# == Schema Information
#
# Table name: user_votes
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class UserVote < ActiveRecord::Base
  validates :user_id, presence: true, uniqueness: true

  belongs_to :user
end
