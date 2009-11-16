ActionController::Routing::Routes.draw do |map|
  map.length '/length', :controller => 'clojure_test', :action => 'length'
  map.get_length '/get_length', :controller => 'clojure_test', :action => 'get_length'
end
