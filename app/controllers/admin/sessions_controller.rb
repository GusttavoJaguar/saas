class Admin::SessionsController < ApplicationController
    layout 'admin'


    def create
        user = warden.authenticate!(scope: :user)

        if user.admin?
            sign_in(:user, user)
            redirect_to "/admin/dashboard"
        else
            sign_out user if user
            redirect_to "/admin/login", alert: "Apenas administradores"
        end
    end
end
