require 'spec_helper'

require 'xcalibur/sld'

#Test_meth = { v2_0: 'C:\\Xcalibur\\methods\\SWG_serum_sample.meth', v2_1: 'C:\\Xcalibur\\methods\\test1_1_etd.meth'}

describe 'Parses SLD files' do
  before(:all) do
    @test_sld = { v2_0: TESTFILES + '/SWG_serum_100511165501.sld', v2_1: TESTFILES + '/_110131184745.sld'}

  end
  it 'parses v2.1 w/postprocessing files' do
    sld_file = @test_sld[:v2_1]
    sld = Xcalibur::Sld.new(sld_file)
    sld.parse
    match = sld.sldrows.first.methodfile
    sld.sldrows.first.methodfile.should == Test_meth[:v2_1]
    sld.sldrows.first.sequence_vial.should == '2A05'
    p sld.sldrows.first
    #sldfile="/home/jtprince/dev/xcalibur-sld/spec/testfiles/_110131184745.sld", methodfile="C:\\Xcalibur\\methods\\test1_1_etd.meth", rawfile="D:\\Data\\HEK_cells\\HEK_phos_enrichment2_110131184757.RAW", sequence_vial="2A05", parsed=true>
  end
  xit 'parses v2.07 files' do
    sld_file = @test_sld[:v2_0]
    sld = Xcalibur::Sld.new(sld_file)
    sld.parse
    sld.sldrows.first.parsed.should == true
    sld.sldrows.first.methodfile.should == Test_meth[:v2_0]
    sld.sldrows.first.sequence_vial.should == '2B01'
  end
  xit 'parses without error these fail cases' do 
    sld_files = ["matt_111108160113.sld", "matt.sld", "matt_111108160025.sld"].map {|b| File.join(TESTFILES, b) }
    expected = [["2F01", "2F02", "2F03", "2F04", "2F05", "2F06"], ["2F01"], [nil]]

    slds = sld_files.zip(expected) do |f,exp| 
      sld = Xcalibur::Sld.new(f)
      sld.parse
      exp.should == sld.sldrows.map {|row| row.sequence_vial if row.parsed }
    end
  end
end
