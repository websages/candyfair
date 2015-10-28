class Selection < ActiveRecord::Base
  belongs_to :user
  belongs_to :candy

  validates :user, :candy, :quantity, presence: true
  validates :quantity, numericality: {only_integer: true, greater_than: 0}
  validates :candy_id, uniqueness: {scope: [:user_id]}

  def to_s
    "#{quantity} #{candy.name.pluralize(quantity)}"
  end
end
