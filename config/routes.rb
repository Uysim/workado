Workado::Engine.routes.draw do
  get "invitations/:token", to: "workado/invitations#accept", as: :accept_invitation
end
