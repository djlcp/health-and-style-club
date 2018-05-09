require "administrate/base_dashboard"

class MasterclassDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    videos: Field::HasMany,
    events: Field::HasMany,
    documents: Field::HasMany,
    id: Field::Number,
    title: Field::String,
    text: Field::Text,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :videos,
    :events,
    :documents,
    :id,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :videos,
    :events,
    :documents,
    :id,
    :title,
    :text,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :title,
    :text,
    :videos,
    :events,
    :documents,
  ].freeze

  # Overwrite this method to customize how masterclasses are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(masterclass)
  #   "Masterclass ##{masterclass.id}"
  # end
end
