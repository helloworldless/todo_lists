class Profile < ActiveRecord::Base
  belongs_to :user

  def self.get_all_profiles(min, max)
    Profile.where("birth_year BETWEEN ? and ?", min, max).order(:birth_year)

  end

  def both_names_not_null
    if first_name.nil? && last_name.nil?
      #errors.add(:first_name, :last_name, "Must supply a value for either First Name or Last Name")
      errors.add(:first_name, "Must supply a value for either First Name or Last Name")
      #errors.add(:last_name, "Must supply a value for either First Name or Last Name")
    end
  end 

  def name_gender_check
    if gender == "male" && first_name == "Sue"
      errors.add(:gender, "Male gender given, but Sue is a female name")
      errors.add(:first_name, "Male gender given, but Sue is a female name")
      #errors.add(:gender, :first_name, "Male gender given, but Sue is a female name")
    end
  end

  validate :both_names_not_null

  validate :name_gender_check

  validates :gender, inclusion: {in: %w(male female),
    message: "%{value} is not a valid gender"}

end
