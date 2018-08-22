# frozen_string_literal: true

#:nodoc:
class MAD::Helper
  def self.primary_role(string)
    return nil if string.blank?
    role = string.split(',').first
    role(role)
  end

  def self.additional_roles(string)
    return nil if string.blank?
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

  def self.create_requests(csv, city)
    csv.each do |row|
      Request.create(user_id: row['Volunteer ID'],
                     document: 'Certificate 2017-2018',
                     status: row['HC fellow approval'].eql?('Eligible') ? 'approved' : 'rejected',
                     template_id: 1,
                     data: { name: row['Name'],
                             city: city,
                             primary_role: MAD::Helper.primary_role(row['Role']),
                             additional_roles: MAD::Helper.additional_roles(row['Role']),
                             email: row['Email'] })
    end
  end

  def self.trigger_emails
    Request.where(status: 'approved').each do |request|
      RequestMailer.document_email(request.id).deliver_later
    end
  end
end