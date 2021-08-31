class Organization < ApplicationRecord
    has_many :nodes, dependent: :destroy
end
