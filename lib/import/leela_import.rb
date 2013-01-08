require 'open-uri'
require 'nokogiri'

class LeelaImport
  def self.import!
    html = open('http://leela.fiit.stuba.sk/psina/jokes/print')
    doc = Nokogiri::HTML(html)

    doc.search('table tbody').each do |tbody|
      trs = tbody.search('tr')

      tds = trs[0].search('td')
      title = tds[0].text
      categories = tds[1].text
      added = Time.parse(tds[2].text.gsub('o', ''))
      score = tds[3].text

      body = trs[1].text
      advice = trs[2].search('p')[1].text

      joke = Joke.new
      joke.body = body
      joke.title = title
      joke.author = 'Leela Import'
      joke.email = 'import@leela'
      joke.advice = advice
      joke.created_at = added
      joke.published = true
      joke.tags = categories[0,49]
      joke.save
    end
  end
end
