class User::Authentication < ApplicationService
  def initialize(options)
    super(options)
    @email = options[:email]
    @password = options[:password]
  end

  def call
    authenticate
  end

  private

  def authenticate
    user = User.find_by(email: @email)
    return error_response(message: I18n.t('auth.error.email')) if user.nil?
    if user.authenticate(@password)
      success_response(message: I18n.t('auth.success.user'), data: user)
    else
      error_response(message: I18n.t('auth.error.password'))
    end
  end
end