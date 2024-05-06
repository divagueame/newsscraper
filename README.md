# README

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


## 1. Set up a new Rails app with Postgresql and Tailwind

## 2. Set up Entry model to represent the scraped data
Each one of the entries scraped from the news will be stored as an Entry in the database. 
All entries have a title and position, optionally they might also have the number of comments and their score. This is also represented on the schema and the validations on the Entry model.
