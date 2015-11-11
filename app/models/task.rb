class Task < ActiveRecord::Base
  belongs_to :subject, inverse_of: :tasks

  validates :name, presence: true, length: { maximum: 20 }
  validates :description, presence: true
  validates :task_order, presence: true, numericality: {only_integer: true,
                                    greater_than_or_equal_to: 0}
  validates :subject, presence: true
end
