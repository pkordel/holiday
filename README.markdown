I'm not sure what's going on here...
====================================

Neither are we. Here are some blog posts on the [how](http://ohthatjames.github.com/2012/06/30/rails-without-rails-code/) and the [why](http://ohthatjames.github.com/2012/06/30/rails-without-rails-code/).

For a [notonthehighstreet.com](http://www.notonthehighstreet.com) hackday, James (@ohthatjames) and Roland (@knaveofdiamonds) attempted to write a Rails app without Rails. It kind of amalgamated [Matt Wynne and Steve Tooke's talk on Hexagonal Rails](http://skillsmatter.com/podcast/home/hexagonal-rails) with Uncle Bob's talk on ["Architecture: the lost years"](http://www.youtube.com/watch?v=WpkDN78P884) with our own random thoughts. We were really trying to answer the question: "what happens if we just use Rails for what it's _really_ good at?"

This is the product of one day of discovery, argument, backtracking, compromise, more arguments and coffee. We're not sure how we feel about it yet (actually, Roland's _pretty_ sure he hates it), but we thought we'd throw it out there as a talking point. It's pretty rough, but the general shape of breaking stuff out into smaller self-contained units is there.

Basic Structure
===============

The app contains 3 main parts:

* holiday: domain logic
* holiday_app: the rails app
* holiday_activerecord: an activerecord-powered implementation of the HolidayRepository.

The app will work completely in memory, or with persistence. Just comment out the contents of ````config/initializers/repository_config.rb```` to run it in-memory. You may want to run ````rake db:migrate```` and ````rake db:seed```` in the holiday_app directory to get some test employees with the ActiveRecord version.

Some key things:

* Our domain models know nothing about either the database or Rails
* We use ActiveModel in Rails to show the holiday request form. This involves mapping our domain model to a kind of ActiveModel "presenter" and back.

Talking points
==============

Here's an incomplete list of stuff we didn't have time to address/just fudged

* Fully flesh out persistent Employees, maybe with more data?
* Sort out the HolidayRequestsController#create method - not sure how much of it belongs there.
* Validations: where do they live?
* Casting of types
* How much of Rails should we use?
* Are we just reinventing the wheel?
* How do we handle editing of objects?
* What about more complex object graphs?
* What about things like authentication?
* Would this work on brownfield apps?
* Just... why?
