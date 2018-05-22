require "administrate/base_dashboard"

class ContentDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    post_contents: Field::HasMany,
    posts: Field::HasMany,
    id: Field::Number,
    content_type: Field::String.with_options(searchable: false),
    description: Field::Text,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    file_url: Field::String,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :post_contents,
    :posts,
    :id,
    :content_type,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :post_contents,
    :posts,
    :id,
    :content_type,
    :description,
    :created_at,
    :updated_at,
    :file_url,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :post_contents,
    :posts,
    :content_type,
    :description,
    :file_url,
  ].freeze

  # Overwrite this method to customize how contents are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(content)
  #   "Content ##{content.id}"
  # end
end
