class RequestMailer < ApplicationMailer
  default from: 'humancapital.tech@makeadiff.in'

  def document_email(request_id)
    @request = Request.find(request_id)
    return nil unless @request.status.eql?('approved')
    attachments['Certificate.pdf'] = Document::PDF.call(template: @request.template,
                                                        data: @request.data).data
    mail(to: @request.data[:email] || 'humancapital.tech@makeadiff.in',
         reply_to: 'humancapital.tech@makeadiff.in',
         subject: 'MAD - Volunteer Certificate 2017-2018')
    @request.status = 'sent'
    @request.save
  end
end
