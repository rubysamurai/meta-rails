# Meta Rails

[![Gem Version](https://badge.fury.io/rb/meta-rails.svg)](https://badge.fury.io/rb/meta-rails)
[![Build Status](https://travis-ci.org/rubysamurai/meta-rails.svg)](https://travis-ci.org/rubysamurai/meta-rails)

Collection of view helpers to improve search engine optimization of Ruby on Rails application by including appropriate meta tags.

## Installation

Open your Rails application's `Gemfile` and add this line:

```ruby
gem 'meta-rails'
```

Save `Gemfile` and execute `bundle` command to install the gem.

## Title

Based on [Google Help](https://support.google.com/webmasters/answer/35624#3) and [Moz](https://moz.com/learn/seo/title-tag) guidelines a proper title consist of *page title*, *brand name*, and *separator* between them.

#### How to use `title` helper

```erb
# Include 'title' helper in the head section of your site
# e.g., ~/app/views/layouts/application.html.erb
<head>
  <%= title %>
</head>

# Utilize 'provide' or 'content for' to store page's title
# e.g., ~/app/views/users/new.html.erb
<% provide(:title, 'Sign up') %>
```

This code will create HTML `<title>` element:

```html
<title>Sign up | AwesomeRailsApp</title>
```

Format of HTML `<title>` element can be modified by passing keyword arguments to `title` helper:

Argument     | Description                                   | Default
-------------|-----------------------------------------------|-----------
`:identifier`| Identifier for stored page's title            | `:title`
`:brand`     | Brand name                                    | Rails.application.class.parent_name
`:separator` | Character between title and brand             | `\|`
`:reverse`   | Switch position of title and brand            | `false`

## Meta description

Meta description tag provides a short summary of the page (refer to [this](https://support.google.com/webmasters/answer/35624?hl=en&ref_topic=6001942#1) and [this](https://moz.com/learn/seo/meta-description) articles for details).

#### How to use `meta_description` helper

```erb
# Include 'meta_description' helper in the head section of your site
# e.g., ~/app/views/layouts/application.html.erb
<head>
  <%= meta_description %>
</head>

# Utilize 'provide' or 'content for' to store page's meta description
# e.g., ~/app/views/users/new.html.erb
<% provide(:meta_description, 'Register to manage your account') %>
```

This code will create HTML `<meta>` tag:

```html
<meta name="description" content="Register to manage your account" />
```

Keyword arguments can be passed to `meta_description` helper:

Argument     | Description                                   | Default
-------------|-----------------------------------------------|-----------
`:identifier`| Identifier for stored page's meta description | `:meta_description`

## Robots

Robots meta tag can control the behavior of search engine crawling and indexing (refer to [this](https://developers.google.com/search/reference/robots_meta_tag) and [this](https://moz.com/learn/seo/robots-meta-directives) articles for details).

#### How to use `robots` helper

```erb
# Include 'robots' helper in the head section of your site
# e.g., ~/app/views/layouts/application.html.erb
<head>
  <%= robots %>
</head>

# Utilize 'provide' or 'content for' to store page's robots directives
# e.g., ~/app/views/users/new.html.erb
<% provide(:robots, 'noindex,nofollow') %>
```

This code will create HTML `<meta>` tag:

```html
<meta name="robots" content="noindex,nofollow" />
```

Keyword arguments can be passed to `robots` helper:

Argument     | Description                                    | Default
-------------|------------------------------------------------|-----------
`:identifier`| Identifier for stored page's robots directives | `:robots`

Please refer to [valid indexing & serving directives](https://developers.google.com/search/reference/robots_meta_tag?csw=1#valid-indexing--serving-directives) page for list of valid robots directives.

## License

`meta-rails` © Dmitriy Tarasov. Released under the [MIT](LICENSE.txt) license.
