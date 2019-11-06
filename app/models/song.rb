class Song < ApplicationRecord
    validates :title, presence: true
    validates :title, uniqueness: { scope: :release_year,
    message: "should happen once per year" }
    validates :released, inclusion: { in: [true, false] }
    validates :release_year, presence: true, if: ->{ released }
    validates :release_year, numericality: {less_than_or_equal_to: Date.today.year }, if: ->{ released }

end
