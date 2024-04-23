FROM ruby:3.1.2-alpine AS base

# Install system dependencies
RUN apk add --no-cache build-base postgresql-dev nodejs yarn

WORKDIR /app

# Install bundler first for caching
COPY Gemfile Gemfile.lock ./
RUN gem install bundler

# Copy application code and install gems
COPY . .
RUN bundle install

# Expose port
EXPOSE 3000

# Start Puma web server
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
