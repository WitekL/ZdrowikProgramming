class StreaksController < ApplicationController
  def index
    # @number_of_days = he_did_programm ? postive_streak_days : negative_streak_days

    @streak = Streak.last
    @created_at = @streak.created_at

    @no_of_days = ((Time.zone.now - @created_at.to_i).to_i/ 1.day) + 1
  end

  def new
    @streak = Streak.new
  end

  def create
    old_streak = Streak.last
    duration = ((Time.now - old_streak.created_at) / (60*60*24)).to_i + 1
    old_streak.duration = duration
    old_streak.save

    @streak = Streak.new(streak_params)
    @streak.save
  end

  def send_mail
    recipients = ["dominika.grenda@gmail.com", "witold.leicht@gmail.com", "q.94941@gmail.com", "kubahorosz95@gmail.com"]

    recipients.each do |recipient|
      UserMailer.stats(recipient).deliver
    end
  end

  private

  def streak_params
    params.require(:streak).permit(:positive)
  end
end
