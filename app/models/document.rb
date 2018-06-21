class Document < ApplicationRecord
  mount_uploader :link, PdfUploader
  belongs_to :masterclass
end
