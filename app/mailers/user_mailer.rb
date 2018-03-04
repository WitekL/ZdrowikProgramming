class UserMailer < ApplicationMailer
  def stats(recipient)
    last_two_streaks = Streak.last(2)
    @streak = last_two_streaks.second
    @previous_streak = last_two_streaks.first
    @longest_positive = Streak.longest_positive
    @longest_negative = Streak.longest_negative

    mail(to: recipient, subject: "ZdrowikProgress weekly insight")
  end
end
