class ApplicationController < ActionController::API
  private
    def select_fields
      fields = []
      params[:fields].split(',').each { |field| fields << field.to_sym }
      fields
    end
end
