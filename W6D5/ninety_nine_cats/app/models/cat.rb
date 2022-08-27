# == Schema Information
#
# Table name: cats
#
#  id          :bigint           not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Cat < ApplicationRecord

    validates :name, :sex, :birth_date, :color, presence: true

    validate :sex_length, :birth_date_cannot_be_future

    def sex_length
        genders = ["m", "M", "f", "F"]
        unless genders.include?(self.sex)
            errors.add(:sex, "Gender can only be M or F")
            p self.errors.full_messages
        end
    end
    
    def birth_date_cannot_be_future
        unless Date.today > self.birth_date
            errors.add(:birth_date, "Date cannot be in the future")
            p self.errors.full_messages
        end
    end

end
