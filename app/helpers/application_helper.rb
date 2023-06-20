module ApplicationHelper
    def login_helper
        if current_user.is_a?(User)
            button_to "Logout", destroy_user_session_path, method: :delete,class: "link-button"
        else
            (link_to "Register", new_user_registration_path, class: "ms-2") + 
            "<br>".html_safe +
            (link_to "Login", new_user_session_path, class: "ms-2")
        end 
    end
end
