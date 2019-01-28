# Gem CanCanCan to Authorize user in rails admin.

class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for Admin privilage:
    if user.admin?
      can :access, :rails_admin
      can :read, :dashboard
      can :manage, :all
    else
      can :read, :all
    end
  end
end
