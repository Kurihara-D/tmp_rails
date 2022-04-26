class Logger
    class AppJsonFormatter < Formatter
      def call(severity, _time, _progname, msg)
        log = {
          time: _time.iso8601(2),
          level: severity,
          progname: _progname,
          type: "default",
        }
  
        unless current_tags.empty?
          tagged = Rails.application.config.log_tags.zip(current_tags).to_h
          log.merge!(tagged)
          msg = msg&.split(' ', current_tags.size + 1)&.last
        end
        begin
          parsed = JSON.parse(msg).symbolize_keys
          log.merge!(parsed)
        rescue JSON::ParserError
          log.merge!({ message: msg })
        end
        log.to_json + "\n"
      end
    end
  end
  
