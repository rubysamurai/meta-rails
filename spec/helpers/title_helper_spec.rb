require 'rails_helper'

RSpec.describe MetaRailsHelpers::TitleHelper, type: :helper do
  describe '#title' do
    it 'returns valid title with default options' do
      expect(helper.title).to eq '<title>MetaRails</title>'
    end

    it 'returns empty title when all options are blank' do
      allow(helper).to receive(:content_for).with(:title).and_return(' ')
      expect(helper.title(separator: ' ', brand: ' ')).to eq '<title></title>'
    end

    context 'page_title' do
      it 'returns valid title when is present' do
        allow(helper).to receive(:content_for).with(:title).and_return('Default')
        expect(helper.title).to eq '<title>Default | MetaRails</title>'
      end

      it 'returns valid title when is nil' do
        allow(helper).to receive(:content_for).with(:title).and_return(nil)
        expect(helper.title).to eq '<title>MetaRails</title>'
      end

      it 'returns valid title when is empty' do
        allow(helper).to receive(:content_for).with(:title).and_return(' ')
        expect(helper.title).to eq '<title>MetaRails</title>'
      end

      it 'returns valid title when option name is not default' do
        allow(helper).to receive(:content_for).with(:page_title).and_return('Example Page')
        expect(helper.title(page_title: :page_title)).to eq '<title>Example Page | MetaRails</title>'
      end
    end

    context 'separator' do
      it 'returns valid title when is present' do
        allow(helper).to receive(:content_for).with(:title).and_return('Default')
        expect(helper.title(separator: '-')).to eq '<title>Default - MetaRails</title>'
      end

      it 'returns valid title when is nil' do
        allow(helper).to receive(:content_for).with(:title).and_return('Default')
        expect(helper.title(separator: nil)).to eq '<title>Default MetaRails</title>'
      end

      it 'returns valid title when is empty' do
        allow(helper).to receive(:content_for).with(:title).and_return('Default')
        expect(helper.title(separator: ' ')).to eq '<title>Default MetaRails</title>'
      end
    end

    context 'brand' do
      it 'returns valid title when is present' do
        expect(helper.title(brand: 'Acme')).to eq '<title>Acme</title>'
      end

      it 'returns valid title when is nil' do
        allow(helper).to receive(:content_for).with(:title).and_return('Default')
        expect(helper.title(brand: nil)).to eq '<title>Default</title>'
      end

      it 'returns valid title when is empty' do
        allow(helper).to receive(:content_for).with(:title).and_return('Default')
        expect(helper.title(separator: '-', brand: ' ')).to eq '<title>Default</title>'
      end
    end

    context 'reverse' do
      it 'returns valid title when is true' do
        allow(helper).to receive(:content_for).with(:title).and_return('Example Page')
        expect(helper.title(reverse: true)).to eq '<title>MetaRails | Example Page</title>'
      end

      it 'returns valid title when is not boolean' do
        allow(helper).to receive(:content_for).with(:title).and_return('Example Page')
        expect(helper.title(reverse: 'reverse')).to eq '<title>Example Page | MetaRails</title>'
      end
    end
  end
end
