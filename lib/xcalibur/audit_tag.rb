require 'xcalibur/file_component'

module Xcalibur
  class AuditTag
    include Xcalibur::FileComponent
      FIELDS = {
        time: [8, :windows_time],
        tag1: [50, :UTF_16LE],
        tag2: [50, :UTF_16LE],
        unknown_long: [4, 'V'],
      }
  end
end
