class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new(role: Role.new)
    user.role.permissions.each do |permission|
      if ["all", "rails_admin"].include?permission.subject_class 
        can permission.action.to_sym, permission.subject_class.to_sym
      else
        can permission.action.to_sym, permission.subject_class.constantize
      end
    end
  end
end
