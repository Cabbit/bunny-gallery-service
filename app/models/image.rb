# frozen_string_literal: true
class Image < ActiveRecord::Base
  include Paperclip::Glue
  has_attached_file :photo, :styles => { medium: "300x300>", thumb: "100x100>" }
  validates_attachment :photo, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
end
