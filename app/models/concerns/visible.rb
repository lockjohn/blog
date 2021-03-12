module Visible
    extend ActiveSupport::Concern

    VALID_STATUSES = ['public', 'private', 'archived']

    included do    
        validates :status, :inclusion { in: VALID_STATUSES}
    end

    def archived?
        status == archived?
    end
end

# https://api.rubyonrails.org/v6.1.3/classes/ActiveSupport/Concern.html