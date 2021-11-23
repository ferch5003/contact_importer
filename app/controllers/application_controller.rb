class ApplicationController < ActionController::Base
  include ErrorHandleable
  include Paginable
end
