module Workado
  class InvitationsController < BaseController
    def accept
      workspace_user = WorkspaceUser.find_by(acceptable_token: params[:token])
      workspace_user.accept!
      redirect_to(Workado.after_accept_path.call)
    end
  end
end
