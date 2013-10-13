# Novosco Tech Blog

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

Creating a post is as simple as:

    middleman article TITLE    # Create a new blog article

Edit your post and make sure the article front matter is complete, e.g.

    ---
    title: Example Draft Article
    date: 2013-04-01
    tags: example, another tag, example, another tag, example, another tag, example, another tag
    author: stejoh # twitter id.
    ---

And then commit, push to github and deploy

    git commit -am "New blog posts synced"
    git push origin master
    middleman deploy # Deploy over git to the gh-pages branch

### Drafts

In order to create a draft post for publishing later, you can add a flag to the front matter, e.g.

    ---
    title: Example Draft Article
    date: 2013-04-01
    tags: example, another tag, example, another tag, example, another tag, example, another tag
    published: false
    author: stejoh
    ---

### Syntax Highlighting

We're using the Rouge Gem (). Demos of supported syntax can be seen here (http://rouge.jayferd.us/demo)

## Syncing Feeds

We are currently taking feeds from two blogs:

http://www.neogeek.net/?feed=rss2
http://everythingsysadmin.wordpress.com/feed/

The process to import these is currently manual, in a sense that you need to run a rake task to import new posts from the feeds, into this blog. The comamnd is

    rake sync_feeds

Once the new feeds have been imported, it's worth checking the posts to make sure it looks ok, and adding a READMORE tag. Anything above READMORE will be shown in the blog summary, specifically as Featured Posts.  And as with any new post in the blog, commit it, push and deploy:
    
    git commit -am "New blog posts synced"
    git push origin master
    middleman deploy

