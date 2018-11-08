class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_monster_set, :reroute_dnd, :set_announcement

  def not_found
    render file: "public/404.html", status: :not_found
  end

  def set_monster_set
    @monster_set = MonsterSet.first
  end

  def set_announcement
    @announcement = Announcement.where("expires_at > ?", Time.now).last
  end

  # For legacy /d&d5esrd urls
  def reroute_dnd
    params[:monster_set_id] = '5esrd' if params[:monster_set_id] == 'd&d5esrd'
  end
end
