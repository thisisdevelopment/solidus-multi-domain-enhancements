module SolidusMultiDomainEnhancements
  module StoreTimezoneHelper
    def localized_time_for_store(timestamp)
      if timestamp.is_a?(Time)
        timestamp.in_time_zone(current_store.timezone)
      else
        Time.parse(timestamp).in_time_zone(current_store.timezone)
      end
    end
  end
end
