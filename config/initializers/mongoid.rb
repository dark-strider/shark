module Mongoid
  module MassAssignmentSecurity
    extend ActiveSupport::Concern

    included do
      attr_accessible(nil)
      self.mass_assignment_sanitizer = :logger
    end
  end

  module Document
    include MassAssignmentSecurity
  end
end