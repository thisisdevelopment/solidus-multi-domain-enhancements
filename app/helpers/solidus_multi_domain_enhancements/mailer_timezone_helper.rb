module SolidusMultiDomainEnhancements
  module MailerTimezoneHelper
    def localized_order_complete_at
      @order.completed_at.in_time_zone(@order.store.timezone)
    end
  end
end
