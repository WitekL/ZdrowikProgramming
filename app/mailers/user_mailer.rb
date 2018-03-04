class UserMailer < ApplicationMailer
  def stats
    @streak = Streak.last
    mail(to: "witold.leicht@gmail.com", subject: "Testin")
  end
end
