require 'rails_helper'

RSpec.describe MetaRailsHelpers::TitleHelper, type: :helper do
  describe '#title' do
    it 'produces title with default options' do
      allow(helper).to receive(:content_for).with(:title).and_return('Default')
      expect(helper.title).to eq '<title>Default | MetaRails</title>'
    end

    it 'produces custom title with page title option' do
      allow(helper).to receive(:content_for).with(:page_title).and_return('Example Page')
      expect(helper.title(page_title: :page_title)).to eq '<title>Example Page | MetaRails</title>'
    end

    it 'produces custom title with separator option' do
      allow(helper).to receive(:content_for).with(:title).and_return('Example Page')
      expect(helper.title(separator: '-')).to eq '<title>Example Page - MetaRails</title>'
    end

    it 'produces custom title with brand option' do
      allow(helper).to receive(:content_for).with(:title).and_return('Example Page')
      expect(helper.title(brand: 'Acme')).to eq '<title>Example Page | Acme</title>'
    end

    it 'produces custom title when page title is omitted' do
      allow(helper).to receive(:content_for).with(:title).and_return(nil)
      expect(helper.title(brand: 'Acme')).to eq '<title>Acme</title>'
    end

    it 'produces custom title with reverse option' do
      allow(helper).to receive(:content_for).with(:title).and_return('Example Page')
      expect(helper.title(reverse: true)).to eq '<title>MetaRails | Example Page</title>'
    end
  end
end
