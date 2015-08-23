require "spec_helper"

describe Huckleberry::Import::Downloader do
  let(:downloader) { described_class.new(directory, version) }
  let(:extraction_path) { "#{directory}/#{version}" }
  let(:directory) { "tmp/usda" }
  let(:version) { "sr27" }
  let(:filenames) do
    [
      "DATA_SRC.txt", "DATSRCLN.txt", "DERIV_CD.txt", "FD_GROUP.txt", "FOOD_DES.txt", "FOOTNOTE.txt", "LANGDESC.txt", "LANGUAL.txt", "NUTR_DEF.txt", "NUT_DATA.txt", "SRC_CD.txt", "WEIGHT.txt", "sr27_doc.pdf"
    ]
  end

  describe "#version_file" do
    subject { downloader.version_file }
    context "with version sr27" do
      it { is_expected.to eq "sr27asc" }
    end
  end

  describe "#download_and_unzip" do
    before do
      stub_request(:get, /.*/).to_return(body: File.read("spec/support/sr27asc.zip"))
      expect(downloader).to receive(:final_path).and_return("/sr27asc.zip")
      downloader.download_and_unzip
    end

    after { downloader.cleanup }

    it "should download and extract all files" do
      filenames.each do |filename|
        expect(File.exists?("#{extraction_path}/#{filename}")).to eql(true)
      end
    end
  end
end
