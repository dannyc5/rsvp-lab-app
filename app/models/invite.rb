class Invite < ActiveRecord::Base
  belongs_to :event

  def invited_user
    Invite.find_by(name: self.name)
  end
end
