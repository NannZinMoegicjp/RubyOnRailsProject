class ApplicationController < ActionController::Base
    include DeviseWhitelist

    before_action :set_source

    def set_source
        if params[:q]
            session[:source] = params[:q]
        end
    end
end
