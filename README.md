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

Based on [Moz](https://moz.com/learn/seo/title-tag) and [Google Help](https://support.google.com/webmasters/answer/35624#3) guidelines a proper title consist of `page title`, describing the page, `brand name` of the website, and `separator` between them.

#### How to use `title` helper

```erb
# Include 'title' helper in the head section of your site
<head>
  <%= title %>
</head>

# Utilize 'provide' or 'content for' to store page's title
<% provide(:title, 'About') %>
```

This code will create HTML `<title>` element:

```html
<title>About | AwesomeRailsApp</title>
```

Format of HTML `<title>` element can be modified by passing options hash to the helper:

Option       | Description                                   | Default
-------------|-----------------------------------------------|-----------
`:page_title`| Identifier for stored page's title            | `:title`
`:brand`     | Brand name                                    | Rails app class
`:separator` | Character between `:page_title` and `:brand`  | `\|`
`:reverse`   | Switch position of `:page_title` and `:brand` | `false`

## Meta description

This tag provides a short description of the page. When page description text is not provided, the helper will not generate meta description tag to avoid potential duplicates.

#### How to use `meta_description` helper

```erb
# Include 'meta_description' helper in the head section of your site
<head>
  <%= meta_description %>
</head>

# Utilize 'provide' or 'content for' to store page's meta description
<% provide(:meta_description, 'A description of the page') %>
```

This code will create HTML `<meta>` tag:

```html
<meta name="description" content="A description of the page" />
```

Options hash can be passed to the helper:

Option             | Description                                   | Default
-------------------|-----------------------------------------------|-----------
`:page_description`| Identifier for stored page's meta description | `:meta_description`


## License

`meta-rails` © Dmitriy Tarasov. Released under the [MIT](LICENSE.txt) license.
