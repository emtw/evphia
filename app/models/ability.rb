class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user
            
    can :manage, User, :id => user.id
    
    if user.has_attribute?("keyholder") && (user.keyholder == true)
      can :read, User, :id => user.user_id
      can :update, User, :id => user.user_id
    end
    
    can :create, User
        
  end
  
end