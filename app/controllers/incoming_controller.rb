class IncomingController < ApplicationController
skip_before_filter :verify_authenticity_token
  def create
    puts "INCOMING PARAMS HERE: #{params}"
    head 200 
  end
end