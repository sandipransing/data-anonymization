module DataAnon
  module Strategy
    module Field


      class AnonymizeHash

        def self.user_defaults user_defaults
          @@user_defaults = user_defaults
        end

        def initialize strategy
          @strategy = strategy
        end

        def anonymize field
          field.value.inject({}) do |hash, (k, v)|
            strategy = @strategy || @@user_defaults[v.class.to_s.downcase.to_sym]
            new_val = if strategy
              strategy.anonymize DataAnon::Core::Field.new(field.name, v, field.row_number, field.ar_record, field.table_name)
            else
              v
            end
            hash[k] = new_val
            hash
          end
        end

      end


    end
  end
end