class Song < ApplicationRecord
    validates :title, :artist_name, presence: true
    
    # Line below is commented out as we're using a checkbox for :released which enforces true or false value
    # validates :released, inclusion: { in: [true, false] }

    validates :title, uniqueness: { scope: :release_year }

    validates :release_year, {
        presence: true, if: ->{ released },
        numericality: {less_than_or_equal_to: Date.current.year}, if: ->{ released }
    }

    # validate :release_year_needed
    # validate :release_status

    # def release_year_needed
    #     if self.released && self.release_year.nil?
    #         errors.add(:release_year, "Release year must be provided if this song has been released")
    #     end
    # end

    # def release_status
    #     if self.released && self.release_year.to_i > Date.current.year
    #         errors.add(:release_year, "Release status must not be true if the release year is to be in future")
    #     end
    # end

end
