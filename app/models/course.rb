class Course < ActiveRecord::Base
  validates :name, presence: true, length:{minimum: 3},
                                   uniqueness: {case_sensitive: false}
  validates :description, presence: true, length:{minimum: 10}
  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :dates_check

  def dates_check
    if start_date > end_date
      errors.add(:start_date, I18n.t("date_check_text"))
    end
  end
end
