module Modules
  module TimeHelper
    def th_tst
      "00:00"
    end

    def hours_to_time_s(hours)

      return "" if not hours

      h = hours.floor
      m = (hours % 1 * 60).round
      return "%02d:%02d" % [h,m]

    end

    def time_s_to_hours(time_s)

      return nil if not time_s or time_s.empty?

      subs = time_s.split(":")
      h = subs[0].to_i
      m = subs[1].to_f/60
      return h+m;

    end
  end
end