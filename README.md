# Dubmeio homework

I am familiar with the [very_good todo example app]([https://en.wikipedia.org/](https://bloclibrary.dev/tutorials/flutter-todos/)) so I intentionally tried to avoid a similar solution. (Once you see it, you can't unsee it)
The TODOs BLoC and TODO handling is greatly simplified compared to the example app, I tried to make up for it with the routing implementation. 

My widget knowledge is showcased with a moderately complex Sliver layout (<code>SliverPinnedHeaderSection</code>)

Tests are missing!

## Structure:

* TODO App
* dubmeio_utils: A collection of useful utilities that can be used in future projects
* dubmeio_widgets: General UI lib for the company for speeding up future app development. Contains:
    * Brand-specific theme
    * Routing implementation for screens that every application has. (auth, splash, etc.)
    * Layout skeletons for things that are a pain to make twice. 
