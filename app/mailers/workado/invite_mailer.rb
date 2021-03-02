module Workado
  class InviteMailer < ::ApplicationMailer
    def invite(workspace_user)
      @workspace_user = workspace_user
      @user = workspace_user.user
      @workspace = workspace_user.workspace
      mail(to: @user.email, subject: "You have been invited to #{@workspace.name}")
    end
  end

end
