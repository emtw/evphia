class Ability
  include CanCan::Ability

  def initialize(model)
    model ||= User.new # guest user
    
    if model.has_attribute?("user") && (model.user == true)        
      can :manage, User, :id => model.id
      can [:create, :read, :update, :destroy], Keyholder do |key|
        key.user_id == model.id
      end
      can [:create, :read, :update, :destroy], Guest do |guest|
        guest.user_id == model.id
      end
      can :manage, Funeral, :id => model.id
    end
    
    if model.has_attribute?("keyholder") && (model.keyholder == true)
      can [:read, :update], User, :id => model.user_id
      can :manage, Keyholder, :id => model.id
    end
    
    if model.has_attribute?("guest") && (model.guest == true)
      can :read, User, :id => model.user_id
      can :manage, Guest, :id => model.id
    end
    
    can :create, User
        
  end
  
end