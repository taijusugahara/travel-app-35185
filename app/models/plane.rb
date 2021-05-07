class Plane < ApplicationRecord
  belongs_to :user
  belongs_to :country
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :thai_plane || :cambo_plane || :vet_plane || :malaysia_plane || :singapore_plane
  belongs_to :timehour
  # has_one :order

  with_options presence: true do
    validates :name, :price, :go_date, :back_date, :go_time, :back_time
    with_options numericality: { greater_than_or_equal_to: 1 } do
      validates :howmany
    end
  end

  validate :date_before_start
  validate :date_before_finish
  validate :name_price
  def date_before_start
    return if go_date.blank?

    errors.add(:go_date, 'は今日以降のものを選択してください') if go_date < Date.today
  end

  def date_before_finish
    return if go_date.blank? || back_date.blank?

    errors.add(:back_date, 'は出発日以降のものを選択してください') if back_date < go_date
  end

  def name_price
    errors.add(:price, '料金が選択した飛行機と合致しません') unless
    name == '飛行機A' && price == 20_000 || name == '飛行機B' && price == 50_000 || name == '飛行機C' && price == 80_000 ||
    name == '飛行機D' && price == 25_000 || name == '飛行機E' && price == 45_000 || name == '飛行機F' && price == 100_000 ||
    name == '飛行機G' && price == 15_000 || name == '飛行機H' && price == 55_000 || name == '飛行機I' && price == 88_000 ||
    name == '飛行機J' && price == 33_000 || name == '飛行機K' && price == 58_000 || name == '飛行機L' && price == 78_000 ||
    name == '飛行機M' && price == 25_000 || name == '飛行機N' && price == 42_000 || name == '飛行機O' && price == 91_000
  end
end
