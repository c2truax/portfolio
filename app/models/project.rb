class Project < ActiveRecord::Base
    has_many :utilizes
    has_many :utilized_tech, through: :utilizes, source: :tech
end
