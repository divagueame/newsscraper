class EntriesController < ApplicationController
  def index
    @entries = FindEntries.new.call(params)
    ScrapeNewsJob.perform_later
  end
end
