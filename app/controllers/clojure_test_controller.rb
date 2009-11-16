class ClojureTestController < ApplicationController  
  def get_length
    @string = params[:string]
    @length = ClojureTest.string_length(@string)
  end
  
end
