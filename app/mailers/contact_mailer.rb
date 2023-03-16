class ContactMailer < ApplicationMailer
  def sned_mail(contact)
    @contact = contact
    mail to: ENV['TOMAIL'], subject: '[お問い合わせ]' + @contact.subject_i18n 
  end
end
