class EntriesController < ApplicationController
  def index
    @entries = FindEntries.new.call(params)

    return unless @entries.empty? | params[:refresh]

    ScrapeNewsJob.perform_later

    redirect_to root_path if params[:refresh].present?
  end
end
