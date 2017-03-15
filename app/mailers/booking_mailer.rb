class BookingMailer < ActionMailer::Base
  default from: "from@example.com"
  def welcome_email(booking)
    @booking = booking
    @url  = 'http://localhost:3000/'
    mail(to: 'verma.ramesh96@gmail.com', subject: 'Welcome to My Awesome Site')
  end
end
