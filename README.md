# Simple blog application
-

Third-party service badges (if available)

[![Build Status](https://semaphoreapp.com/api/v1/projects/665573b7-d994-484e-a1ef-41201156fa38/303069/shields_badge.svg)](https://semaphoreapp.com/arthur-zaharov/personal-blog)
[![Test Coverage](https://codeclimate.com/github/ArthurZaharov/personal-blog/badges/coverage.svg)](https://codeclimate.com/github/ArthurZaharov/personal-blog)
[![Code Climate](https://codeclimate.com/github/ArthurZaharov/personal-blog/badges/gpa.svg)](https://codeclimate.com/github/ArthurZaharov/personal-blog)

This is simple application. User can sign up, sign in, create and edit articles, leave comments to articles, observe all articles.
-

Dependencies
-

Information about external dependencies (redis, mongo, postgres, etc) and how you can obtain them (via homebrew, apt-get or from ftp).

Information about ruby and rails versions.

- PostgreSQL 9.3.5
  - `brew install postgres`
- Ruby 2.1.2
  - `rbenv install 2.1.2`
- Rails 4.1.7
  - `gem install rails`

Quick Start
-

Clone this repo:

```
git clone git@github.com:ArthurZaharov/personal-blog.git
cd repo
```

Run bootstrap script

```
bin/bootstrap
```

Initializers
-

* `01_config.rb` - shortcut for getting application config with `app_config`
* `mailer.rb` - setup default hosts for mailer from configuration
* `requires.rb` - automatically requires everything in lib/ & lib/extensions

Scripts
-

* `bin/bootstrap` - setup required gems and migrate db if needed
* `bin/quality` - run brakeman and rails_best_practices for the app
* `bin/ci` - should be used in the CI to run specs

Documentation & Examples
-

Where is documentation and examples (e.g. `./docs`)?

Continuous Integration
-

CI service info and status (if available).
Project page on [Semaphore](https://semaphoreapp.com/arthur-zaharov/personal-blog).

Staging
-

Staging server on [Heroku](https://morning-sea-2816.herokuapp.com)

Production
-

Location and other info about production servers.

Third-party services
-

Code Climate, etc

Workflow
-

Information about base branch, branch naming, commit messages, specs and pull requests. Check out our [guides](https://github.com/fs/guides/tree/master/development/maintain-existing-project/workflow).
