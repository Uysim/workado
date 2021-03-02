require "workado/engine"
require "workado/version"

module Workado
  class Error < StandardError; end

  mattr_accessor :user_class
  @@user_class = nil

  mattr_accessor :roles
  @@roles = []

  mattr_accessor :default_role
  @@default_role = nil

  mattr_accessor :after_accept_path
  @@after_accept_path = ->{ "/" }


  def self.setup
    yield self
  end

  def self.user_model
    @@user_model ||= user_class.constantize
  end

  def self.default_url_options
    Rails.application.routes.default_url_options.merge(Rails.application.config.action_mailer.default_url_options)
  end
end
