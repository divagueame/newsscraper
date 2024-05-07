require 'nokogiri'
require 'open-uri'

class ScrapeNewsJob < ApplicationJob
  queue_as :default

  def perform(*_args)
    url = 'https://news.ycombinator.com/'
    selectors = {
      title: 'tr.athing .titleline > a',
      position: '.rank',
      comments: './/a[contains(text(), "comments")]',
      points: '.score',
      info_row: 'tr.athing + tr'
    }
    html = URI.open(url).read
    doc = Nokogiri::HTML(html)

    titles_info = doc.css(selectors[:title])
    positions_info = doc.css(selectors[:position])
    info_rows = doc.css(selectors[:info_row])

    entries = []
    info_rows.each_with_index do |info_row, index|
      title = titles_info[index].text
      position = positions_info[index].text.chomp('.').to_i

      points_text = info_row.css(selectors[:points]).text
      points = points_text ? points_text.scan(/\d+/).first.to_i : 0

      comments_element = info_row.xpath(selectors[:comments])
      comments_text = comments_element&.text || ''
      comments = comments_text.scan(/\d+/).first.to_i || 0

      entries << [title:, position:, comments:, points:]
    end

    Entry.destroy_all
    Entry.create(entries)
  end
end
