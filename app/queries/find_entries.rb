class FindEntries
  attr_reader :entries

  def initialize(entries = initial_scope)
    @entries = entries
  end

  def call(params = {})
    scoped = @entries
    sort(scoped, params[:order_by])
  end

  def sort(scoped, order_by)
    ordered_by = Entry::ORDER_BY.fetch(order_by&.to_sym, Entry::ORDER_BY[:position_asc])

    scoped.order(ordered_by)
  end

  def initial_scope
    Entry.all
  end
end
