module UsersHelper
    def is_admin?
        if self.admin 
            "/admin/sessions/new"
        else
            '/sessions/new'
        end
    end
end
