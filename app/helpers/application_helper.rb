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

    def sample_helper
        # "<div class='my-class'>My content</div>".html_safe
        content_tag(:div, "My content", class: "my-class")
    end

    def source_helper(layout_name)
        if session[:source]
            greeting = "Thanks for visiting me from #{session[:source]} and you are on the #{layout_name}"
            content_tag(:p, greeting, class: "source-greeting")
        end
    end
end
