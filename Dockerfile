# Step 1: Base image
FROM ruby:3.1

# Step 2: Set working directory
WORKDIR /app

# Step 3: Install dependencies
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# Step 4: Install bundler and Rails
COPY Gemfile Gemfile.lock ./
RUN gem install bundler && bundle install

# Step 5: Copy app code
COPY . .

# Step 6: Precompile assets and setup database
RUN bundle exec rake assets:precompile
RUN bundle exec rake db:migrate

# Step 7: Expose port
EXPOSE 3000

# Step 8: Start the Rails server
CMD ["rails", "server", "-b", "0.0.0.0"]
