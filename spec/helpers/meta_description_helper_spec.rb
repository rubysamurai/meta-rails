require 'rails_helper'

RSpec.describe MetaRailsHelpers::MetaDescriptionHelper, type: :helper do
  describe '.meta_description' do
    context 'identifier' do
      it 'returns valid meta description when is present' do
        allow(helper).to receive(:content_for).with(:meta_description).and_return('A description of the page')
        expect(helper.meta_description).to eq '<meta name="description" content="A description of the page" />'
      end

      it 'returns nil when is nil' do
        allow(helper).to receive(:content_for).with(:meta_description).and_return(nil)
        expect(helper.meta_description).to eq nil
      end

      it 'returns nil when is empty' do
        allow(helper).to receive(:content_for).with(:meta_description).and_return(' ')
        expect(helper.meta_description).to eq nil
      end

      it 'returns valid meta description when name is not default' do
        allow(helper).to receive(:content_for).with(:page_summary).and_return('Meta description')
        expect(helper.meta_description(identifier: :page_summary)).to eq '<meta name="description" content="Meta description" />'
      end
    end
  end
end
