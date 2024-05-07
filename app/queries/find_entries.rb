class FindEntries
  attr_reader :entries

  def initialize(entries = initial_scope)
    @entries = entries
  end

  def call(params = {})
    scoped = @entries
    scoped = filter_by_min_words_count(scoped, params[:min_words_count])
    scoped = filter_by_max_words_count(scoped, params[:max_words_count])
    sort(scoped, params[:order_by])
  end

  def filter_by_max_words_count(scoped, max_words_count)
    return scoped unless max_words_count.present?

    scoped.with_title_word_count_less_than(max_words_count)
  end

  def filter_by_min_words_count(scoped, min_words_count)
    return scoped unless min_words_count.present?

    scoped.with_title_word_count_greater_than(min_words_count)
  end

  def sort(scoped, order_by)
    ordered_by = Entry::ORDER_BY.fetch(order_by&.to_sym, Entry::ORDER_BY[:position_asc])

    scoped.order(ordered_by)
  end

  def initial_scope
    Entry.all
  end
end
