## Links
[Demo](https://newsscraper.chiki.tech/)
[Repository](https://github.com/divagueame/newsscraper)

## Task description 
Using the language that you feel most proficient in, create a web crawler using scraping techniques to extract the first 30 entries from https://news.ycombinator.com/. You'll only care about the **title**, **the number of the order**, **the number of comments**, and **points for each entry**.


From there, we want it to be able to perform a couple of filtering operations:
- Filter all previous entries with more than five words in the title ordered by the number of comments first.
- Filter all previous entries with less than or equal to five words in the title ordered by points.


We will measure the performance of the provided solution and your ability to test the requested operations in the scenarios described above. In addition, we'd love to see the following in your code for extra points:

- Good object-oriented/functional code.
- Avoiding repetition and favoring a consistent organization. 
- You should stick to the semantics of your chosen language and be as consistent as possible.
- Correct usage of version control tools, with a good commit history and incremental software delivery practices.
- Automated testing with any framework or tool of your choice.

## Commits

1. Set up a new Rails app with Postgresql and Tailwind

2. Set up Entry model to represent the scraped data
Each one of the entries scraped from the news will be stored as an Entry in the database. 
All entries have a title and position, optionally they might also have the number of comments and their score. This is also represented on the schema and the validations on the Entry model.

3. Style entries partial + Add svg files
Basic styling of the entries partial and add the 'inline_svg' gem and some assets to be used in the application.

4. Add footer + Github link to repository

5. Add RSpec gem + Factory Bot Gem

6. Set up tests for 'EntriesController'

7. Add 'FindEntries' query object

8. Set up Entry factory bot

9. Add ScrapeNewsJob

10. Add sorting to 'FindEntries' query object

11. Add scopes -> :with_title_word_count_greater_than & :with_title_word_count_less_than to Entry model

12. Test Entry model validations

13. Allow refresh of entries to refetch the scraped news

14. Add links to sort and refresh the data

15. Add demo GIF

16. Show number of results when a query is present

## Test suite
```bash
➜  newsscraper git:(main) ✗ bundle exec rspec
.......................

Finished in 0.12147 seconds (files took 0.4662 seconds to load)
23 examples, 0 failures
```


## Screenshots

![Demo](./public/demo/1.gif)
