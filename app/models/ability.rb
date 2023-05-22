class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.is_a?(Patient)
      can :manage, Patient
      can :show, Recommendation
      can :manage, Appointment
    elsif user.is_a?(Doctor)
      can :manage, Doctor
      can :manage, Recommendation
    elsif user.is_a(AdminUser)
      can :manage, :all
    else
      cannot :manage, :all
    end
  end
end
