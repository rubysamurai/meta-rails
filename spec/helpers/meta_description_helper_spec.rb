RSpec.describe MetaRailsHelpers::MetaDescriptionHelper, type: :helper do
  describe '.meta_description' do
    context 'with identifier' do
      it 'returns meta description when identifier is present' do
        allow(helper)
          .to receive(:content_for).with(:meta_description).and_return(
            'A description of the page'
          )
        expect(helper.meta_description)
          .to eq '<meta name="description" content="A description of the page" />'
      end

      it 'returns nil when identifier is nil' do
        allow(helper).to receive(:content_for).with(:meta_description).and_return(nil)
        expect(helper.meta_description).to eq nil
      end

      it 'returns nil when identifier is empty' do
        allow(helper).to receive(:content_for).with(:meta_description).and_return(' ')
        expect(helper.meta_description).to eq nil
      end

      it 'returns meta description when not default identifier' do
        allow(helper).to receive(:content_for).with(:page_summary).and_return('Meta description')
        expect(helper.meta_description(identifier: :page_summary))
          .to eq '<meta name="description" content="Meta description" />'
      end
    end
  end
end
