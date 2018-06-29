status = self['status']
if status.eql?('approved')
  summary_ie = InternshipExecution.find_by(id: '5b42a9caad75276d1d359c11')
  de = summary_ie.leads.find_by(de_id: self['de_id'])
  de = summary_ie.leads.create(de_name: self['name'], de_id: self['de_id'], status: 'sent_for_approval') unless de.present?
  aud = de['audits'] || []
  de.update(audits: nil)
  de = summary_ie.leads.find_by(de_id: self['de_id'])
  aud << "https://admin.awign.com/admins/leads/#{self['_id']}"
    audits = de['audits_completed'].to_i || 0
    rating = de['overall_rating'].to_f || 0
    audits_completed = audits + 1
    overall_rating = ((rating  * audits) + self['final_rating'].to_f ) / de['audits_completed'].to_f

    last_audit_penalty= self['penalty'].to_i
    total_penalty= (de['total_penalty'] || 0) + last_audit_penalty.to_i
  Lead::Update.call(lead: de.reload,  
                    params: { status: 'sent_for_approval',
                              audits: aud, 
                              audits_completed: audits, 
                              overall_rating: overall_rating, 
                              last_audit_penalty: last_audit_penalty, 
                              total_penalty: total_penalty })
end
status
