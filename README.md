# Background & Motivation

If you have ever walked anywhere with me, you might find yourself walking ahead alone, realizing that I've stopped to look at something. If you wonder why I'm staring intently at the cracks in the concrete, I'm admiring someone's crisp whiteout lines, trying to make out a meanstreak tag, or ducking into an alleyway because my eye caught the edge of a throw-up. People like me, our senses are restless when confronted with an empty brick wall, our eyes can't help locking onto underpasses, rooftops, benches, light poles, and alleyways. I'm thankful for every train ride I've ever taken, every time I've wondered how they got up there, and every opportunity I have to be caught in the grip of the city. This project is my love letter to graffiti.

The historical foundations of this tool can be explained by the legend Futura, courtesy of Marc Ecko: https://youtu.be/6ik9Ga0FvLI

The application serves as a tool to catalog graffiti flicks in an ordered format, where you can list the writer's name, crew, a description of the piece, and the address it was taken it. The address works as a geocoding tool for a map that shows you where you've taken graffiti flicks, and who was up when you took it. Like a Strava for graff, showing you where you've been and where you could go to find more graff. Enjoy, it's pretty easy to use.

Important note: Be careful what you upload, this app is made to be a PokeDex of OTHER writers, which scratches that part of my mind that is reminded that vandalism is illegal, and cities have entire departments allocated to finding them. I know nothing about data security yet, so it's better to be safe than sorry. But more importantly, app or not, keep a blackbook and never stop writing.

If you ever knew a chubby brown guy whose friends called him NEMO, peace.

# Rails Template

This is a base Ruby on Rails repository configured for learning with Codespaces (and Gitpod).

- Ruby version: `3.2.1`
- Rails version: `7.1.3.3`


We've added additional Ruby gems and other software that aren't automatically available in a new Rails app, and configured 

### UJS and Turbo

In Rails version 7, support for Unobtrusive JavaScript (UJS) is not the default. Rather, [this has been replaced with Turbo](https://guides.rubyonrails.org/working_with_javascript_in_rails.html#turbo).

However, in AppDev, we typically want to first demonstrate UJS and then enable Turbo manually when we want it.

Therefore, UJS has been pre-configured here with these steps: 

- Pin UJS + jQuery in `config/importmap.rb` by running:

    ```
    % ./bin/importmap pin @rails/ujs
    % ./bin/importmap pin jquery
    ```

- Add UJS + jQuery via:

    ```js
    // app/javascript/application.js
    import jquery from "jquery";
    window.jQuery = jquery;
    window.$ = jquery;
    import Rails from "@rails/ujs"
    Rails.start();
    ```

UJS and Turbo can co-exist side-by-side with [these instructions, which we already implemented here](https://github.com/hotwired/turbo-rails/blob/main/UPGRADING.md#upgrading-from-rails-ujs--turbolinks-to-turbo).

By default, Turbo is disabled via:

```js
// app/javascript/application.js
import { Turbo } from "@hotwired/turbo-rails"
Turbo.session.drive = false
```

Set it to `true` to enable Turbo everywhere, or you can use `data-turbo="true"` to enable Drive on a per-element basis while leaving it globally `false`.

### Additional gems:

- [`appdev_support`](https://github.com/firstdraft/appdev_support)
- [`annotate`](https://github.com/ctran/annotate_models)
- [`awesome_print`](https://github.com/awesome-print/awesome_print)
- [`better_errors`](https://github.com/BetterErrors/better_errors)
- [`binding_of_caller`](https://github.com/banister/binding_of_caller)
- [`dotenv-rails`](https://github.com/bkeepers/dotenv)
- [`draft_generators`](https://github.com/firstdraft/draft_generators/)
- [`draft_matchers`](https://github.com/jelaniwoods/draft_matchers/)
- [`devise`](https://github.com/heartcombo/devise)
- [`faker`](https://github.com/faker-ruby/faker)
- [`grade_runner`](https://github.com/firstdraft/grade_runner/)
- [`htmlbeautifier`](https://github.com/threedaymonk/htmlbeautifier/)
- [`http`](https://github.com/httprb/http)
- [`pry_rails`](https://github.com/pry/pry-rails)
- [`rails_db`](https://github.com/igorkasyanchuk/rails_db)
- [`rails-erd`](https://github.com/voormedia/rails-erd)
- [`rspec-html-matchers`](https://github.com/kucaahbe/rspec-html-matchers)
- [`rspec-rails`](https://github.com/rspec/rspec-rails)
- [`rufo`](https://github.com/ruby-formatter/rufo)
- [`specs_to_readme`](https://github.com/firstdraft/specs_to_readme)
- [`table_print`](https://github.com/arches/table_print)
- [`web_git`](https://github.com/firstdraft/web_git)
- [`webmock`](https://github.com/bblimke/webmock)

### Additional software:
- OS Ubuntu 20.04.5 LTS
- Chromedriver
- Fly.io's `flyctl`
- Google Chrome (headless browser)
- Graphviz
- Node JS 18
- NPM 8.19.3
- Postgresql 12
- Redis
- Yarn

### VS Code extensions:
- vortizhe.simple-ruby-erb
- mbessey.vscode-rufo
- aliariff.vscode-erb-beautify
- eamodio.gitlens
- setobiralo.erb-commenter
