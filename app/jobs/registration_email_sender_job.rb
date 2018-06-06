class RegistrationEmailSenderJob < ApplicationJob
  queue_as :default

  def perform(email, name)
    UserMailer.registration_email(email, name).deliver_now
  end
end
