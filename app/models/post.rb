# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  url        :string
#  content    :text
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ActiveRecord::Base
  validates :title, :author, presence: true
  validates :subs, length: {minimum: 1}

  has_many :post_subs, dependent: :destroy, inverse_of: :post

  has_many :subs,
  through: :post_subs,
  source: :sub

  belongs_to :author,
  foreign_key: :user_id,
  class_name: :User

end
