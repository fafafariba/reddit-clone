# == Schema Information
#
# Table name: post_subs
#
#  id         :integer          not null, primary key
#  post_id    :integer          not null
#  sub_id     :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class PostSub < ActiveRecord::Base
  validates_uniqueness_of :sub_id, scope: :post_id
  validates :sub, :post, presence: true

  belongs_to :sub

  belongs_to :post

end
