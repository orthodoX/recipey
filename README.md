# Recipey

This is the exercise for the [Marley Spoon coding challenge](https://gist.github.com/lawitschka/063f2e28bd6993cac5f8b40b991ae899). The steps to run it, test it and additonal notes are below.

## Environment and setup

The app was done in Ruby `2.7.2` and Rails `6.1.2`. Just do a typical `bundle install` and `bin/rails s` to start the app (the binstubs are actually faster than `bundle exec` 🙃). The main endpoint is [http://localhost:3000/recipes](http://localhost:3000/recipes)

## Formatting and testing

The app has a bundled `rubocop` for code formatting, you can run `bin/rubocop` for the formatting check. Tests are written in `rspec`, to execute them just run `bin/rspec`.

## Design solutions

As per Contentful docs I used their `contentful` gem to consume ther API. I wrapped the implementation in the `Content::Loader` service class, which would enable an easy switch of a content provider in a real life scenario.

Also for the UI part I decided to go with [TailwindCSS](https://tailwindcss.com), which is now my top pick for any fresh project, since it's *utility first*, it's tiny in production and for the most time you build your UI, without leaving your HTML files. The UI is not perfect, but it has some basic responsivness for diferent devices, I'd say enough for this presentation purposes.

## Known concerns

The one thing I realized while I was coding this exercise is that testing will be a bit tricky to do properly in the time scope I reserved for it. Mainly because the app's sole purpose is to consume a third party API, so that means the tests would need to rely heavily on mocking. Honestly, I'm not an advocate of mocking, I think it should be avoided in any case possible. I had a lot of challenges with heavily mocked test suits in my career.

The only way to do a proper mocking would be I guess to use the `vcr` gem, and when I checked the contentful gem source code, I realized [they used the same approach](https://github.com/contentful/contentful.rb/blob/master/spec/entry_spec.rb). VCR has it's own downside as well, if it's used to much in the test suite, it will drastically impact the overall execution time.

So, at the end, I decided not to mock the tests at all (which makes execution a bit slower), since doing it properly would take me much more time which I didn't plan for this exercise. Which means the tests are not perfect, but they should be enough to give you a clue how do I write them generally.

## Conclusion

If you guys have any additional questions regarding my solution, I'd be more than happy to discuss them with you. Happy reviewing!
