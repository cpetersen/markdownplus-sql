require "markdownplus/sql/version"
require "sequel"

module Markdownplus
  module Sql
    class SqlHandler < Handler
      def execute(input, parameters, variables, warnings, errors)
        output = nil
        if parameters==nil
          errors << "No connection url given"
        elsif parameters.count == 0
          errors << "No connection url given"
        else
          warnings << "More than one parameter given" if parameters.count > 1
          if(input==nil || input.strip.empty?)
            errors << "No sql statement given"
          else
            url = parameters.first
            begin
              database = Sequel.connect(url)
              dataset = database[input]
              i = 0
              output = CSV.generate do |csv|
                dataset.each do |row|
                  if i==0
                    csv << row.collect { |k,v| k }
                  end
                  i += 1
                  csv << row.collect { |k,v| v }
                end
              end
            rescue => e
              output = input
              errors << "Error opening [#{e.message}]"
            end
          end
        end
        output
      end
    end
    HandlerRegistry.register("sql", SqlHandler)
  end
end
