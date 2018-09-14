require "mdstyle_linker"

RSpec.describe MdstyleLinker do
  it "has a version number" do
    expect(MdstyleLinker::VERSION).not_to be nil
  end

  context "Normal processing" do
    it "can generate [title](url) by URL" do
      url = "https://en.wikipedia.org/wiki/Ruby_(programming_language)"
      ans = "[Ruby (programming language) - Wikipedia](https://en.wikipedia.org/wiki/Ruby_(programming_language))"
      expect(MdstyleLinker.mdstyle(url)).to eq ans
    end
    it "case of title has bracket" do
      url = "https://github.com/halllllll/mdstyle_linker"
      ans = "[GitHub - halllllll/mdstyle_linker: generate markdown style link from URL (e.g. \\\[title\\\](url))](https://github.com/halllllll/mdstyle_linker)"
      expect(MdstyleLinker.mdstyle(url)).to eq ans
    end
  end
end
