class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy, inverse_of: :cocktail
  has_many :ingredients, through: :doses
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  # This basically allows you to create a new dose from a cocktail
  #  c = Cocktail.create(name: "test", doses_attributes: [{ingredient_id: , description: },{...}])
  accepts_nested_attributes_for :doses, reject_if: :all_blank, allow_destroy: true
end
