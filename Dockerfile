FROM ruby:2.3.1
MAINTAINER david.roy@cabbit.co.uk

ENV REFRESHED_AT 2015-03-13
ENV RACK_ENV=production

# Update repo
RUN apt-get -y update

RUN mkdir -p /var/www/bunny

# Copy the app code
COPY . /var/www/bunny

# Change workdir
WORKDIR /var/www/bunny

# Expose port 5000
EXPOSE 5000

# Gem setup
RUN gem install foreman
RUN bundle install

# Run goliath in production mode
CMD ["/bin/bash","-c", "bundle exec foreman start -e production"]
