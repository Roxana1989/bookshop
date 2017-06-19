require 'rails_helper'

describe BaseController do
  it { should_not use_before_action :verify_authenticity_token }

  it { should be_a ApplicationController }

  it { should use_before_action :setup_default_format }

  describe '#setup_default_format' do
    describe 'format wasnt specified' do
      before { expect(controller).to receive_message_chain(:params, :[]).with(no_args).with(:format).and_return nil }

      before { expect(controller).to receive_message_chain(:request, :format=).with(no_args).with :json }

      it { expect { controller.send :setup_default_format }.to_not raise_error }
    end

    describe 'format was specified' do
      before { expect(controller).to receive_message_chain(:params, :[]).with(no_args).with(:format).and_return :json }

      it { expect { controller.send :setup_default_format }.to_not raise_error }
    end
  end
end
