class KeyAbility
  include CanCan::Ability

  def initialize(key)
    key ||= Keyholder.new # guest user

            
    can :read, User, :id => key.user_id
    can :index, User
        
  end
  
end