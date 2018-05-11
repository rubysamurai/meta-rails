require 'rails_helper'

RSpec.describe MetaRailsHelpers::RobotsHelper, type: :helper do
  describe '#robots' do
    it 'returns valid robots meta when is present' do
      allow(helper).to receive(:content_for).with(:robots).and_return('noindex,nofollow')
      expect(helper.robots).to eq '<meta name="robots" content="noindex,nofollow" />'
    end

    it 'returns nil when is nil' do
      allow(helper).to receive(:content_for).with(:robots).and_return(nil)
      expect(helper.robots).to eq nil
    end

    it 'returns nil when is empty' do
      allow(helper).to receive(:content_for).with(:robots).and_return(' ')
      expect(helper.robots).to eq nil
    end

    it 'returns valid robots meta when identifier name is not default' do
      allow(helper).to receive(:content_for).with(:androids).and_return('noindex')
      expect(helper.robots(identifier: :androids)).to eq '<meta name="robots" content="noindex" />'
    end
  end
end
