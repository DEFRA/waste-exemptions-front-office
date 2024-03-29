# frozen_string_literal: true

module DataLayerHelper
  def data_layer(transient_registration)
    output = []

    data_layer_hash(transient_registration).each do |key, value|
      output << "'#{key}': '#{value}'"
    end

    # rubocop:disable Rails/OutputSafety
    output.join(",").html_safe
    # rubocop:enable Rails/OutputSafety
  end

  private

  def data_layer_hash(transient_registration)
    {
      journey: data_layer_value_for_journey(transient_registration)
    }
  end

  def data_layer_value_for_journey(transient_registration)
    return :reregister if reregister?(transient_registration)

    data_layer_value_by_type(transient_registration)
  end

  def data_layer_value_by_type(transient_registration)
    case transient_registration
    when WasteExemptionsEngine::BackOfficeEditRegistration
      :back_office_edit
    when WasteExemptionsEngine::FrontOfficeEditRegistration
      :front_office_edit
    when WasteExemptionsEngine::NewRegistration
      :new
    when WasteExemptionsEngine::RenewingRegistration
      :renew
    end
  end

  def reregister?(transient_registration)
    transient_registration.start_option == "reregister"
  end
end
