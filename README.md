## Princess Robot Academy

This is an example app to demonstrate the different ways to test your code. This example covers the following:

* Feature Tests (Capybara/Rspec)
* Model Tests (Rspec)
* Controller Tests (Rspec)
* API Controller Tests (Rspec)
* React Testing (Karma/Enzyme)

To run your spec tests, run the following after git clone:

```no-highlight
$ bundle install
$ rake db:create
$ rake db:migrate
$ rake
```

You can also run `rspec spec/features`, `rspec spec/controllers` or `rspec spec/models` to run a specific spec folder.

To run your React tests, use the following commands:

```no-highlight
$ npm install
$ npm test
```

To run the app in it's entirety, run the following commands:

```no-highlight
$ rails s
```

and in another tab in your terminal, run

```no-highlight
$ npm start
```
