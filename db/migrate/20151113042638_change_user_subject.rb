class ChangeUserSubject < ActiveRecord::Migration
  def change
    drop_table :user_subjects
  end
end
