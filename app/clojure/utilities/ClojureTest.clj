(ns utilities.ClojureTest
  (:use utilities.support)
  (:gen-class
    :methods [#^{:static true} [stringLength [String] int]]))

(defn -stringLength [s]
  (length-of-string s))
