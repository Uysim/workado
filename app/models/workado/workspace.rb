module Workado
  class Workspace < ApplicationRecord
    self.table_name = "workado_workspaces"
    has_many :workspace_users, dependent: :destroy
    validates :name, presence: true

    def invite_user(email:, **params, &block)
      user = Workado.user_model.find_by(email: email)
      if user.blank?
        user = Workado.user_model.new(email: email)
        yield(user) if block_given?
        user.save!
      end
      self.workspace_users.create!(user: user, **params)
    end
  end
end
