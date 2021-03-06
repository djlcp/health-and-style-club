require "administrate/base_dashboard"

class ServersettingDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    active: Field::Boolean,
    reactivation_date: Field::DateTime,
    task_name: Field::Select.with_options(collection: [:SignUp]),
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :task_name,
    :active,
    :reactivation_date,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :task_name,
    :active,
    :reactivation_date,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :task_name,
    :active,
    :reactivation_date,
  ].freeze

  # Overwrite this method to customize how subscriptions are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(serversettings)
  #   "serversettings ##{serversettings.id}"
  # end
end
