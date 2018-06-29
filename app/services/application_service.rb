# Advanced service class which helps manage response
class ApplicationService < BaseService
  attr_reader :response

  def initialize(options = {})
    @response = OpenStruct.new
  end

  def self.call(*args)
    service_object = self.new(*args)
    service_object.call
    service_object.response
  end

  protected

  def update_response(options)
    @response.status = options[:status] if options[:status].present?
    @response.message = options[:message] if options[:message].present?
    @response.data = options[:data] if options[:data].present?
  end

  def success_response(options = {})
    @response.status =  options[:status] || 'success'
    @response.message = options[:message]
    @response.data = options[:data]
    @response['success?'] = true
  end

  def error_response(options = {})
    @response.http_status = options[:http_status] || 400
    @response.status = options[:status] || 'error'
    @response.message = options[:message]
    @response.data = options[:data]
    @response['success?'] = false
  end
end