## Reading List:

* [Essential RubyOnRails patterns — part 1: Service Objects](https://medium.com/selleo/essential-rubyonrails-patterns-part-1-service-objects-1af9f9573ca1)

* [Using Service Objects in Ruby on Rails](https://blog.appsignal.com/2020/06/17/using-service-objects-in-ruby-on-rails.html)

### To start this applications:

<pre><code>
# start database
pg_ctl start

# start server
rails s

# run elastic search
</code></pre>


### For ElasticSearch, run this:

[Starting a single node cluster with Docker](https://www.elastic.co/guide/en/elasticsearch/reference/7.17/docker.html#docker-cli-run-dev-mode)
<pre><code>
bundle install

docker run -p 127.0.0.1:9200:9200 -p 127.0.0.1:9300:9300 -e "discovery.type=single-node" docker.elastic.co/elasticsearch/elasticsearch:7.17.8

</code></pre>

### Image Previews with Active Storage

<pre><code>
# start database
pg_ctl start

rails active_storage:install

rails g stimulus previews
</code></pre>