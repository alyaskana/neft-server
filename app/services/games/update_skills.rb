module Games
  class UpdateSkills < ApplicationService
    def call(user, skills)
      fish = user.fishes.find_by(is_active: true)
      skills.each do |key, value|
        Skill.find_or_create_by!(fish: fish, key: key).update!(is_active: value)
      end
    end
  end
end
