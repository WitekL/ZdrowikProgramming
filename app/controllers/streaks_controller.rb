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
    @streak = Streak.new(streak_params)

    if @streak.save
      redirect_to
    else
      render 'index'
    end
  end

  def send_mail
    UserMailer.stats.deliver
  end

  private

  def streak_params
    params.require(:streak).permit(:positive)
  end
end
