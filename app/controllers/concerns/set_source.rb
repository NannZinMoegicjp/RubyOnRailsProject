module  SetSource
    extend ActiveSupport::Concern

    included do
        before_action :set_source
    end
   
    def set_source
        if params[:q]
            session[:source] = params[:q]
        end
    end
end