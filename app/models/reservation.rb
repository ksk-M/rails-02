class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validate :check_in_is_after_today
  validate :check_in_before_check_out
  validates :check_in, :check_out, :number_of_people, presence: true
  validates :number_of_people, numericality: {greater_than_or_equal_to: 1}

  def check_in_is_after_today
    if check_in && (check_in < Time.zone.today) # 偽かnilの場合にfalseが返る
      errors.add(:check_in, "は本日以降の日付にしてください")
    end
  end

  def check_in_before_check_out
    if check_in && (check_out) && (check_in >= check_out) # 偽かnilの場合にfalseが返る
      errors.add(:check_out, "はチェックイン日より後の日付にしてください")
    end
  end
end
