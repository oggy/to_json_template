## `to_json` Template

Rails plugin that adds a template handler, `to_json`, which will eval
the template, call #to_json on the result, and render it.

This could be viewed as Builder for JSON, but much simpler.  There is
no API to learn--it just calls #to_json on the result.  It gives you
full access to helpers in constructing your JSON structures, letting
you keep your JSON logic out of your controllers, keep your JSON lean,
and share code between your actions.

## Example

In app/controllers/pages_controller.rb:

    class PagesController < ApplicationController
      def index
        @pages = Page.all
      end
    end

In app/views/pages/index.json.to_json:

    @pages.map do |page|
      # ...helpers may be accessed here if necessary...
      page.attributes.slice('url', 'views', 'title', 'extract')
    end

## JSONP

If you name your view `.to_jsonp` instead of `.to_json`, it will
return a JSONP call, using the `callback` parameter for the name of
the callback.  If no `callback` parameter is given, it just returns
standard JSON.

## Copyright

Copyright (c) 2009 George Ogata, released under the MIT license
