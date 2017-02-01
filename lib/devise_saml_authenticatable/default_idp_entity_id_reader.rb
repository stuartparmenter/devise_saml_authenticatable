module DeviseSamlAuthenticatable
  class DefaultIdpEntityIdReader
    def self.entity_id(params)
      if params[:SAMLRequest]
        OneLogin::RubySaml::SloLogoutrequest.new(params[:SAMLRequest], settings: Devise.saml_config).issuer
      elsif params[:SAMLResponse]
        OneLogin::RubySaml::Response.new(params[:SAMLResponse], settings: Devise.saml_config).issuers.first
      end
    end
  end
end
