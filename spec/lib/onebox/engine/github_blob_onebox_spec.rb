require "spec_helper"

describe Onebox::Engine::GithubBlobOnebox do
  before(:all) do
    @link = "https://github.com/discourse/discourse/blob/master/lib/oneboxer/github_blob_onebox.rb"
    fake(@link, response(described_class.template_name))
  end
  before(:each) { Onebox.defaults.cache.clear }

  let(:link) { @link }

  it_behaves_like "an engine"

  describe "#to_html" do
    let(:html) { described_class.new(link).to_html }

    it "has file name" do
      expect(html).to include("github_blob_onebox.rb")
    end

    it "has number of lines" do
      expect(html).to include("50")
    end

    it "has blob contents" do
      expect(html).to include("module Oneboxer")
    end

    it "has URL" do
      expect(html).to include(link)
    end
  end
end