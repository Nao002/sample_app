class List < ApplicationRecord
  #Listモデルにtitleとbody に加えて画像を扱うためのimageカラムが追記されたかのように扱うことができる。
  has_one_attached :image
  validates :title, presence: true
  validates :body, presence: true
  validates :image, presence: true
end
