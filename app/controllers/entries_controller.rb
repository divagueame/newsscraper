class EntriesController < ApplicationController
  def index
    @entries = FindEntries.new.call(params)
  end
end
