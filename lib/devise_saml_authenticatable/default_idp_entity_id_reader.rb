module DeviseSamlAuthenticatable
  class DefaultIdpEntityIdReader
    include DeviseSamlAuthenticatable::SamlConfig
    def self.entity_id(params)
      if params[:SAMLRequest]
        OneLogin::RubySaml::SloLogoutrequest.new(params[:SAMLRequest], settings: saml_config).issuer
      elsif params[:SAMLResponse]
        OneLogin::RubySaml::Response.new(params[:SAMLResponse], settings: saml_config).issuers.first
      end
    end
  end
end
