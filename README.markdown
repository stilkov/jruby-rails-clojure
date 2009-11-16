## JRuby/Rails/Clojure Integration

A very simple example showing how to integrate JRuby, Rails and Clojure:

There are two clojure source files in `app/clojure`: `utilities/support.clj` and `utilities/ClojureTest.clj`. I ended up with these as I played around with namespaces. `support.clj` simply defines a single function in the `utilities.support` namespace.

`ClojureTest.clj` references the `clojure.support` namespace and defines a namespace `utilities.ClojureTest`. This is mapped (via genclass) to a Java class ClojureTest in the utilities namespace. ClojureTest exposes a single function (stringLength); think of this as the API your Clojure lib exposes to the JRuby world.

There's a simple rake task in `lib/tasks/clojure.rake` that has two targets: `rake clojure:compile` will compile the stuff in `app/clojure` to the `tmp/target/classes` directory. `rake clojure:jar` (which depends on `clojure:compile`) creates a jar file in the lib directory for each top-level directory in `app/clojure` (e.g. utilities.jar) 

In the controller `clojure_test_controller.rb`, the function `ClojureTest::string_length` is invoked. If Rails can't resolve a module, it ends up looking for a .rb file in lib that has the corresponding name in lower case and with underscores. `lib/clojure_test.rb` simply does a `java_import` to create a module that contains the functions defined in the ClojureTest class.

Interesting things that one might do:

* Define more rake tasks for Clojure, e.g. for a REPL, for Swank etc. This should probably be a separate project.
* Show some more sample interactions, e.g. send-off to an agent from within a controller or access to a Clojure persistent data structure from JRuby
* Show how to access JRuby from Clojure, e.g. to access models