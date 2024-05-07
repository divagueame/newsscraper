class FindEntries
  attr_reader :entries

  def initialize(entries = initial_scope)
    @entries = entries
  end

  def call(params = {})
    scoped = @entries
  end

  def initial_scope
    Entry.all
  end
end
