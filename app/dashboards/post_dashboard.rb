require "administrate/base_dashboard"

class PostDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    user: Field::BelongsTo,
    comments: Field::HasMany,
    post_contents: Field::HasMany,
    category: Field::BelongsTo,
    contents: Field::HasMany,
    id: Field::Number,
    title: Field::String,
    body_text: Field::Ckeditor,
    paid_for: Field::Boolean,
    state: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    image: Field::Carrierwave.with_options(
      image: :standard,
      # image_on_index: true,
      # remove: false,
      # remote_url: false
    )
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :user,
    :title,
    #:comments,
    :category,
    # :post_contents,
    # :contents,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :user,
    # :post_contents,
    # :contents,
    # :id,
    :title,
    :category,
    :body_text,
    :paid_for,
    :state,
    :created_at,
    :updated_at,
    :image,
    :comments,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :user,
    # :comments,
    # :post_contents,
    # :contents,
    :title,
    :body_text,
    :category,
    # :paid_for,
    # :state,
    :image,
  ].freeze

  # Overwrite this method to customize how posts are displayed
  # across all pages of the admin dashboard.
  #
def display_resource(post)
  post.title
  end
end
