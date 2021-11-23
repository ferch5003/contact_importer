class ApplicationController < ActionController::Base
  include ActiveStorage::SetCurrent
  include ErrorHandleable
  include Paginable
end
