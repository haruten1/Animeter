class MyWork < ApplicationRecord
    belongs_to :user,optional: true
    belongs_to :works,optional: true
end
