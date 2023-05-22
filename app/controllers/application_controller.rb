class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    if resource.is_a?(Patient)
      patient_path
    elsif resource.is_a?(Doctor)
      doctor_path
    else
      super
    end
  end
end
