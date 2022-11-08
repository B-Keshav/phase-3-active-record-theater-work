class Role < ActiveRecord::Base
    has_many :auditions

    def actors
        self.auditions.map {|actor_hash| actor_hash.actor}
    end

    def location
        self.auditions.map {|actor_hash| actor_hash.location}
    end

    def lead 
        if(self.auditions.find_by(hired: true))
            self.auditions.find_by(hired: true)
        else
            "No actor has been hired for this role"
        end
    end

    def understudy
        if(self.auditions.where(hired: true)[1])
            self.auditions.where(hired: true)[1]
        else
            "No actor has been hired for understudy for this role"
        end
    end
end