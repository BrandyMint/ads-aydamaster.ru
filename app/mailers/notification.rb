class Notification < ActionMailer::Base
  default :from => "mailer@aydamaster.ru"

  def place_sharing(email, place, guest = nil)
    @place_link = place_path(place)

    if guest
      @guest = guest
      template = "place_sharing_with_existing_user"
    else
      @signin_link = new_user_registration_path
      template = "place_sharing_with_non_existing_user"
    end

    mail(
      :to => email,
      :subject => "Вы получили доступ к рекламной площадке на aydamaster.ru"
    ) do |format|
        format.text{ render template }
      end
  end
end
