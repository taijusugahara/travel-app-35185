class PlaneBack < ApplicationRecord
  belongs_to :user
  belongs_to :country
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :thai_plane_back || :cambo_plane_back || :vet_plane_back || :malaysia_plane_back || :singapore_plane_back

  with_options presence: true do
    validates :name, :price, :back_date, :back_time
    with_options numericality: { greater_than_or_equal_to: 1 } do
      validates :howmany
    end
  end

  validate :date_before_start
  validate :name_price
  def date_before_start
    return if back_date.blank?

    errors.add(:back_date, 'は今日以降のものを選択してください') if back_date < Date.today
  end

  def name_price
    errors.add(:price, '料金が選択した飛行機と合致しません') unless
    name == '飛行機A' && price == 18_000 || name == '飛行機B' && price == 22_000 || name == '飛行機C' && price == 33_000 ||
    name == '飛行機D' && price == 27_000 || name == '飛行機E' && price == 35_000 || name == '飛行機F' && price == 44_000 ||
    name == '飛行機G' && price == 11_000 || name == '飛行機H' && price == 27_000 || name == '飛行機I' && price == 40_000 ||
    name == '飛行機J' && price == 13_000 || name == '飛行機K' && price == 22_000 || name == '飛行機L' && price == 30_000 ||
    name == '飛行機M' && price == 21_000 || name == '飛行機N' && price == 28_000 || name == '飛行機O' && price == 48_000
  end
end
