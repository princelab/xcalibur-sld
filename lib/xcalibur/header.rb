require 'xcalibur/file_component'
require 'xcalibur/audit_tag'

module Xcalibur
  class Header
    include Xcalibur::FileComponent

    FIELDS = {
      magic:         [ 2, 'v'],
      signature:     [ 18, :UTF_16LE],
      unknown_long1: [ 4, 'V'],
      unknown_long2: [ 4, 'V'],
      unknown_long3: [ 4, 'V'],
      unknown_long4: [ 4, 'V'],
      version:       [ 4, 'V'],
      audit_start:   [ 112, Xcalibur::AuditTag],
      audit_end:     [ 112, Xcalibur::AuditTag],
      unknown_long5: [ 4, 'V'],
      unknown_area:  [ 60, 'a'],
      tag:           [ 1028, :UTF_16LE],
    }

  end
end
