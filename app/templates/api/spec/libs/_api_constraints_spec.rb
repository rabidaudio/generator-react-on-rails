require 'spec_helper'
require 'api_constraints'

describe ApiConstraints do


  let(:api_constraints_v1) { ApiConstraints.new version: 1 }
  let(:api_constraints_v2) { ApiConstraints.new version: 2, default: true }


  describe '#matches?' do

    context 'when version contains Accept header with API version' do
      it 'matches API version from header' do
        req = double( host: 'api.lvh.me:3000',
                      headers: { "Accept" => "application/vnd.<%= name %>.v1+json" })
        expect(api_constraints_v1.matches?(req)).to be true
      end
    end

    context 'when no Accept header present' do
      it 'matches default API version' do
        req = double(host: 'api.lvh.me:3000')
        expect(api_constraints_v2.matches?(req)).to be true
      end
    end

  end


end
