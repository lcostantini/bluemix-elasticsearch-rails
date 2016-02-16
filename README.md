# Description
The idea of this app is to use as example to figure out how it works [Elasticsearch](https://www.elastic.co/)
service in [Bluemix](https://console.ng.bluemix.net/).

This app was created using the Rails command *rails g scaffold* and is a simple
CRUD for posts. I added a search box to find the posts using Elasticsearch.

To load the DB with posts I added a seed that reads a file with many words in
english and generate 1_000 posts.
The title of the posts have an id and two random words. The body have 20 random words.

# Install
You need to have the Elasticsearch service running.
1. Clone this repo.
2. Run the migrations **rake db:migrate**.
3. Load the DB with 1000 posts **rake posts:seed**.
4. Run the server **rails s**.
