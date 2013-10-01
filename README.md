# Novosco Engineering

## Dependencies

To get started with the application locally, follow these steps.

## Update to Ruby 2.0

### RVM (local on a mac)

RVM (https://rvm.io) allows you to run multiple versions of Ruby.  .ruby-version and .ruby-gemset files are recognised by RVM and will automatically set the right versions to use.  To install RVM and use Ruby 2.0.0:

    curl -L https://get.rvm.io | bash
    rvm install 2.0.0
    rvm use 2.0.0 --default

### Bundler

This will install all gems required to run the app.

    gem install bundler
    cd novoscoeng
    bundle install

## Development

Running the app in development

    middleman

## Deployment

The site is hosted on Github using the **gh-pages** branch. To deploy the website to Github pages, use

    middleman deploy

## Posting Blogs

### Syntax Highlighting

We're using the Rouge Gem (). Demos of supported syntax can be seen here (http://rouge.jayferd.us/demo)
