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

Based on [Moz](https://moz.com/learn/seo/title-tag) and [Google Help](https://support.google.com/webmasters/answer/35624#3) guidelines a proper title consist of *page title*, *brand name*, and *separator* between them.

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

Format of HTML `<title>` element can be modified by passing options hash to the `title` helper:

Option       | Description                                   | Default
-------------|-----------------------------------------------|-----------
`:page_title`| Identifier for stored page's title            | `:title`
`:brand`     | Brand name                                    | Rails.application.class.parent_name
`:separator` | Character between `:page_title` and `:brand`  | `\|`
`:reverse`   | Switch position of `:page_title` and `:brand` | `false`

## Meta description

Meta description tag provides a short summary of the page. 

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

Options hash can be passed to `meta_description` helper:

Option             | Description                                   | Default
-------------------|-----------------------------------------------|-----------
`:page_description`| Identifier for stored page's meta description | `:meta_description`


## License

`meta-rails` © Dmitriy Tarasov. Released under the [MIT](LICENSE.txt) license.
