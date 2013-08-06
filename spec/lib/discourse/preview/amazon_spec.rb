require "spec_helper"

describe Discourse::Oneboxer::Preview::Amazon do
  describe "#to_html" do
    it "returns the product title" do
      amazon = described_class.new(Nokogiri::HTML(File.read(File.join("spec","fixtures","amazon.response"))))
      expect(amazon.to_html).to include("Knit Noro: Accessories: 30 Colorful Little Knits [Hardcover]")
	  end

    it "returns the product image" do 
      amazon = described_class.new(Nokogiri::HTML(File.read(File.join("spec","fixtures","amazon.response"))))
      expect(amazon.to_html).to include("http://ecx.images-amazon.com/images/I/61mI3YmHVnL._BO2,204,203,200_PIsitb-sticker-arrow-click,TopRight,35,-76_AA300_SH20_OU01_.jpg");
    end

    it "returns the product description" do 
      amazon = described_class.new(Nokogiri::HTML(File.read(File.join("spec","fixtures","amazon.response"))))
      expect(amazon.to_html).to include("Using only the finest natural materials and ecologically sound manufacturing processes, Japanese designer Eisaku Noro has been producing some of the most extraordinary and popular yarns in the world for over 30 years. Hand colored in vivid combinations of painterly hues, Noro yarns are as striking to behold as they are easy to work with. This follow-up to Knit Noro features 32 small projects knitters can complete in a weekend, including Leg Warmers, Cabled Mittens, a Lace Flap Hat, and even an iPad cover.");
    end
  end
end
