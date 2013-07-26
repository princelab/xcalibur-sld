
module Xcalibur
  module FileComponent

    attr_accessor :fields
    attr_accessor :data

    # looks for the constant for the class and merges with the given fields
    def initialize(fields={})
      @fields = self.class.const_get(:FIELDS).merge(fields)
      @data = {}
    end

    # assumes the string encoding is set to ASCII binary. returns self
    def parse!(string)
      loc = 0
      fields.each do |key,(length, unpack_code)|
        substring = string[loc,length]
        data[key] = 
          case unpack_code
          when String
            substring.unpack(unpack_code)
          when Symbol
            case unpack_code
            when :windows_time
              (w1, w2) = substring.unpack('VV')
              Time.at( (w2 *  4294967296 + w1) / 10000000 - 11644473600 ) # 100s of ns since Jan 1 1601
            else
              substring.force_encoding(Encoding.const_get(unpack_code))
              substring
            end
          when Class
            unpack_code.new.parse!(substring)
          else
            substring
            # need to implement another object
          end
        loc += length
      end
      self
    end

    # returns the length as an Integer or nil if variable
    def byte_length
      fields.values.inject(0) {|sum,ar| sum + ar.first }
    end

  end
end
