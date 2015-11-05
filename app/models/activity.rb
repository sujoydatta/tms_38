class Activity < ActiveRecord::Base
  belongs_to :user
  belongs_to :course
  belongs_to :user_subject
end
