class UserValidator < ActiveModel::Validator 
    def validate(record)
        if is_not_business_email(record.email) == true
            record.errors.add(:base, "This is not a business email!")
        end
    end

    def is_not_business_email(email_address)
        matching_regex = /^[\w.+\-]+@(live|hotmail|outlook|aol|yahoo|rocketmail|gmail)\.com$/
        std_email_match = email_address.match(matching_regex)
        std_email_match.present?
    end
end