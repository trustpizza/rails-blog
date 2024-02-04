class AccountMailer < ApplicationMailer
    def test_email
        mail(to: 'maxelolsson@gmail.com', subject: 'Welcome to My Awesome Site')
    end
end
