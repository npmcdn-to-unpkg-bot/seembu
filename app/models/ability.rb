class Ability
  include CanCan::Ability

  def initialize(user)
    # if user.has_role? :Client
    #     can :read, Project
    # elsif user.has_role? :Professional
    #     can :manage, Project
    # else
    #     can :read, Project
    # end
        
  end
end
