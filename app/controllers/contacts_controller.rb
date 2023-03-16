class ContactsController < ApplicationController

  def new
    @contact = Contact.new
  end

  def confirm
    @contact = Contact.new(contact_params)
    if @contact.invalid?
      render :new
    end
  end

  def back
    @contact = Contact.new(contact_params)
    render :new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.sned_mail(@contact).deliver_now
      redirect_to done_path
    else
      render :new
    end
  end

  def done
  end
  # 送信完了画面で使う

  private

  def contact_params
    params.require(:contact)
          .permit(:email,
                  :name,
                  :subject,
                  :message
                  )
  end

end
