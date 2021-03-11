class Article < ApplicationRecord
    has_many :comments
    
    validates :title, presence: true
    validates :body, presence: true, length: { minimum: 10 }

    VALID_STATUSES = ['public', 'private', 'archived']

    validates :status, :inclusion { in: VALID_STATUSES}

    def archived?
        status == 'archived'
    end
end

# Rails provides a feature called validations to help us deal with invalid user input. Validations are rules that are checked before a model object is saved. If any of the checks fail, the save will be aborted, and appropriate error messages will be added to the errors attribute of the model object.