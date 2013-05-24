class Ability
  include CanCan::Ability

  def initialize(usr)
    if usr
      @user = usr
    else
      @user = User.new
      @user.role = :guest
    end
    send(@user.role)
  end

  def guest
    can :read, :all
  end

  def user
    can :manage, :all
  end

  def seller
    can :manage, :all
  end

  def admin
    can :manage, :all
  end
end