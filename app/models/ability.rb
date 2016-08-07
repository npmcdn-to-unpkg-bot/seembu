class Ability
  include CanCan::Ability

  def initialize(user)
    if user.has_role? :Client
        can :read, Project
        can :manage, Profile
    elsif user.has_role? :Professional
        can :manage, Project
        can :manage, Profile
    else
        can :read, Project
        can :read, Profile
    end
        
  end
end
