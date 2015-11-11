class ChangeDatetimeFormatInCourses < ActiveRecord::Migration
  def up
    change_column :courses, :start_date, :date
    change_column :courses, :end_date, :date
  end

  def down
    change_column :courses, :start_date, :datetime
    change_column :courses, :end_date, :datetime
  end
end
