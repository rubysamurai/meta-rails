RSpec.describe MetaRailsHelpers::RobotsHelper, type: :helper do
  describe '.robots' do
    context 'with identifier' do
      it 'returns valid robots meta when identifier is present' do
        allow(helper).to receive(:content_for).with(:robots).and_return('noindex,nofollow')
        expect(helper.robots).to eq '<meta name="robots" content="noindex,nofollow" />'
      end

      it 'returns nil when identifier is nil' do
        allow(helper).to receive(:content_for).with(:robots).and_return(nil)
        expect(helper.robots).to eq nil
      end

      it 'returns nil when identifier is empty' do
        allow(helper).to receive(:content_for).with(:robots).and_return(' ')
        expect(helper.robots).to eq nil
      end

      it 'returns valid robots meta when not default identifier' do
        allow(helper).to receive(:content_for).with(:androids).and_return('noindex')
        expect(helper.robots(identifier: :androids))
          .to eq '<meta name="robots" content="noindex" />'
      end
    end
  end
end
