# Xcalibur::Sld

Cross-platform access to the Thermo's sequence SLD files.

NOTE: Each raw file [embeds the information from the sequence
row](https://code.google.com/p/unfinnigan/wiki/SeqRow) where it was injected.
This can be easily accessed with the
[unfinnigan](https://code.google.com/p/unfinnigan/) uf-seqrow commandline tool
(which is cross-platform).

## Installation

    gem install xcalibur-sld

## Examples

(Commandline access coming soon)

    require 'xcalibur/sld'
    sld = Xcalibur::Sld.new("file.sld")
    header = sld.header
    sld.rows.each do |row|
      p row.methodname
    end

## Acknowledgements

This project relied heavily on the information found on the wiki of Gene
Selkov's awesome [unfinnigan project](https://code.google.com/p/unfinnigan/).
