class Agent < ApplicationRecord

  has_many :appointments
  has_many :clients, through: :appointments



  def agenda
    appointments
  end

  def route
    clients.pluck(:address)
  end



end
