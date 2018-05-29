class Contact < MailForm::Base
  attribute :name       :validate => true
  attribute :email
  attribute :message    :validate => true
  attribute :nickname   :validate => true
end
