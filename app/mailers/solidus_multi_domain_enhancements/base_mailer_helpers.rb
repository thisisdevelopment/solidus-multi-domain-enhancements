module SolidusMultiDomainEnhancements
  module BaseMailerHelpers
    extend ActiveSupport::Concern

    included do
      helper 'solidus_multi_domain_enhancements/mailer_timezone'
    end
  end
end
