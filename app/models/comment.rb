# == Schema Information
#
# Table name: comments
#
#  id                :integer          not null, primary key
#  content           :text             not null
#  user_id           :integer          not null
#  post_id           :integer          not null
#  parent_comment_id :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Comment < ActiveRecord::Base
  validates :content, :author, :post, presence: true

  belongs_to :author,
    foreign_key: :user_id,
    class_name: :User

  belongs_to :post

  belongs_to :parent_comment,
    foreign_key: :parent_comment_id,
    class_name: :Comment


end
