require "administrate/base_dashboard"

class UserDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    comments: Field::HasMany,
    posts: Field::HasMany,
    subscription: Field::HasOne,
    id: Field::Number,
    email: Field::String,
    password: Field::String,
    encrypted_password: Field::String,
    role: Field::Select.with_options(collection: [:admin, :contributor, :subscriber]),
    reset_password_token: Field::String,
    reset_password_sent_at: Field::DateTime,
    remember_created_at: Field::DateTime,
    sign_in_count: Field::Number,
    current_sign_in_at: Field::DateTime,
    last_sign_in_at: Field::DateTime,
    current_sign_in_ip: Field::String,
    last_sign_in_ip: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    first_name: Field::String,
    surname: Field::String,
    middle_names: Field::String,
    phone: Field::String,
    address_line_1: Field::String,
    address_line_2: Field::String,
    city: Field::String,
    state: Field::String,
    country: Field::String,
    post_code: Field::String,
    bio: Field::Ckeditor,
    bioavatar: Field::String
    # bioavatar: Field::Carrierwave.with_options(
    #   image: :standard,
    # )
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    # :posts,
    # :subscription,
    # :id,
    :email,
    :role,
    :encrypted_password
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    # :posts,
    # :id,
    :email,
    :encrypted_password,
    :role,
    :bio,
    :subscription,
    # :reset_password_token,
    # :reset_password_sent_at,
    # :remember_created_at,
    # :sign_in_count,
    # :current_sign_in_at,
    # :last_sign_in_at,
    # :current_sign_in_ip,
    # :last_sign_in_ip,
    # :created_at,
    # :updated_at,
    :first_name,
    :surname,
    # :middle_names,
    :phone,
    :address_line_1,
    :address_line_2,
    :city,
    :state,
    :country,
    :post_code,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    # :posts,
    :email,
    :password,
    :role,
    # :reset_password_token,
    # :reset_password_sent_at,
    # :remember_created_at,
    # :sign_in_count,
    # :current_sign_in_at,
    # :last_sign_in_at,
    # :current_sign_in_ip,
    # :last_sign_in_ip,
    :first_name,
    :surname,
    # :middle_names,
    :phone,
    :address_line_1,
    :address_line_2,
    :city,
    :state,
    :country,
    :post_code,
    :bio,
    :bioavatar,
    :subscription,
  ].freeze

  # Overwrite this method to customize how users are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(user)
    user.email
  end
end
