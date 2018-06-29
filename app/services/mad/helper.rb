class MAD::Helper 
  def self.primary_role(string)
    role = string.split(',').first
    role(role)
  end

  def self.additional_roles(string)
    roles = string.split(',')
    roles.shift
    roles.map{|role| role(role)}.join(', ')
  end

  def self.role(string)
    case string.strip
    when 'ES Volunteer'
      'Academic Support Volunteer'
    when 'HC Volunteer'
      'Human Capital Volunteer'
    when 'Mentor', 'Mentors'
      'Academic Support Mentor'
    when 'FR Volunteer'
      'Fundraising Volunteer'
    else
      string.strip
    end
  end
end