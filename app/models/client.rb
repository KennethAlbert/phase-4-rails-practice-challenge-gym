class Client < ApplicationRecord
    has_many :memberships,:dependent => :destroy
    has_many :gyms,through: :memberships

    def total
        amount = 0
        self.memberships.each do |m|
            amount += m.charge
        end
        amount
    end
end
