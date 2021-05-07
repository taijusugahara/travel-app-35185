class Tour < ApplicationRecord
  belongs_to :user
  belongs_to :country
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :thai_tour || :cambo_tour || :vet_tour || :malaysia_tour || :singapore_tour
  belongs_to :tour_span

  with_options presence: true do
    validates :name, :price, :go_date, :span
    with_options numericality: { greater_than_or_equal_to: 1 } do
      validates :howmany
    end
  end

  validate :date_before_start
  validate :name_price
  def date_before_start
    return if go_date.blank?

    errors.add(:go_date, 'は今日以降のものを選択してください') if go_date < Date.today
  end

  def name_price
    errors.add(:price, '選択したツアーと料金または期間が合致しません') unless
    name == 'ツアーA' && price == 100_000 && span == 5 || name == 'ツアーB' && price == 150_000 && span == 7 || name == 'ツアーC' && price == 120_000 && span == 10 ||
    name == 'ツアーD' && price == 130_000 && span == 5 || name == 'ツアーE' && price == 170_000 && span == 7 || name == 'ツアーF' && price == 200_000 && span == 10 ||
    name == 'ツアーG' && price == 150_000 && span == 5 || name == 'ツアーH' && price == 190_000 && span == 7 || name == 'ツアーI' && price == 260_000 && span == 10 ||
    name == 'ツアーJ' && price == 140_000 && span == 5 || name == 'ツアーK' && price == 175_000 && span == 7 || name == 'ツアーL' && price == 235_000 && span == 10 ||
    name == 'ツアーM' && price == 170_000 && span == 5 || name == 'ツアーN' && price == 185_000 && span == 7 || name == 'ツアーO' && price == 290_000 && span == 10
  end
end
