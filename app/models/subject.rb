class Subject < ActiveRecord::Base
  validates :name, presence: true,
                   length: { maximum: 20 },
                   uniqueness: {case_sensitive: false}
  validates :description, presence: true, length: { minimum: 50 }
end
