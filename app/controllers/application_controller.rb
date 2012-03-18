class ApplicationController < ActionController::Base
  protect_from_forgery
  include ApplicationHelper
  RubyPython.configure :python_exe => 'python2.6'
end
