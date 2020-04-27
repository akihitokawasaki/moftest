class Station < ApplicationRecord
    belongs_to :build ,optional: true
end
