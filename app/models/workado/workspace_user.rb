module Workado
  class WorkspaceUser < ApplicationRecord
    extend Enumerize
    self.table_name = "workado_workspace_users"
    has_secure_token :acceptable_token

    belongs_to :workspace
    belongs_to :user, polymorphic: true

    enumerize :role, in: Workado.roles, default: Workado.default_role, scope: true, predicates: true

    validates :role, presence: true

    after_create :send_invitation_mailer, if: ->{ accepted_at.blank? }

    def self.accept!(token)
      record = find_by(acceptable_token: token)
      record.accept!
      record
    end

    def accepted?
      accepted_at.present?
    end

    def accept!
      update!(accepted_at: Time.current)
    end

    def accept
      update(accepted_at: Time.current)
    end

    def send_invitation_mailer
      InviteMailer.invite(self).deliver_now
    end
  end
end
