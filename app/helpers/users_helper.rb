module UsersHelper
    def available_roles_for_user(user)
        available_roles = []
        if user.admin?
          available_roles = ['user', 'author']
        elsif user.owner?
          available_roles = ['user', 'author', 'admin']
        end
        available_roles
    end
end
