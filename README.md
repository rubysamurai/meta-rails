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

### Title tag helper

While technically title element is not a meta tag, it is considered to be one of the most important information sources for search engines.

Optimal format for title, based on [Moz](https://moz.com/learn/seo/title-tag) and [Google Help](https://support.google.com/webmasters/answer/35624#3):

`<Page title> <Separator> <Brand Name>`

`meta-rails` has `title` helper to generate proper title element based on three properties, page title, separator, brand name: 

Property   | Default value 
-----------|---------------
Page title | `nil`         
Separator  | `|`           
Brand name | Rails app name

Page title value comes from assuming you are using either `content_for` or `provide` helper in the page view to store page's title, otherwise it will not be included and created title will consist only of brand name without page title and separator.

#### How to use `title` helper

```erb
# Utilize 'provide' or 'content for' to store page's title.
# mysite/app/views/static/contact.html.erb

<% provide(:title, 'Contact Us') %>
<%# other elements %>

# Include 'title' helper in the <head> section of your site:
# mysite/app/views/layout/application.html.erb

<head>
  <%= title %>
  <%# other elements %>
</head>
```

This code will create HTML `<title>` element:

```html
<title>Contact Us | Your Rails app name</title>
```

#### Options for `title` helper

Exact format of HTML `<title>` element can be modified by passing options hash to the helper:

Name         | Description                                   | Default
-------------|-----------------------------------------------|-----------
`:page_title`| Identifier for stored page's title.           | `:title`
`:separator` | Character between `:page_title` and `:brand`  | `|`
`:brand`     | Your brand or site name.                      | Rails app name
`:reverse`   | Switch position of `:page_title` and `:brand` | `false`

Example of `title` helper usage with options:

```erb
# mysite/app/views/static/contact.html.erb

<% provide(:title, 'Contact Us') %>
<%# other elements %>

# mysite/app/views/layout/application.html.erb

<head>
  <%= title(page_title: :page_keyword,
            separator: '-',
            brand: 'MyBrand',
            reverse: true) %>
  <%# other elements %>
</head>
```

This example code will create HTML `<title>` element:

```html
<title>MyBrand - Contact Us</title>
```

## Contributing

Anyone is welcome to contribute to Meta Rails. Please [raise an issue](https://github.com/rubysamurai/meta-rails/issues), fork the project, make changes to your forked repository and submit a pull request.

## License

`meta-rails` © Dmitriy Tarasov, 2015. Released under the [MIT](https://github.com/rubysamurai/meta-rails/blob/master/LICENSE.txt) license.
