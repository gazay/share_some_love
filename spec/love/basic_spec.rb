require 'spec_helper'

describe Love do

  describe '#config' do

    it 'should set property by_gemname to true if there arg by_gem' do
      Love.config ['by_gem']
      expect(Love.by_gemname).to be_truthy
    end

    it 'should set property by_gemname to false if there no arg by_gem' do
      Love.config
      expect(Love.by_gemname).to be_falsey
    end

    it 'should set property for_site to true if there arg site' do
      Love.config ['site']
      expect(Love.for_site).to be_truthy
    end

    it 'should set property for_site to false if there no arg site' do
      Love.config
      expect(Love.for_site).to be_falsey
    end

    it 'should set property check_author to true if there arg -v' do
      Love.config ['-v']
      expect(Love.check_author).to be_truthy
    end

    it 'should set property check_author to false if there no arg -v' do
      Love.config
      expect(Love.check_author).to be_falsey
    end

    it 'should set property root to lib folder' do
      Love.config
      expect(Love.root).to eq(Pathname(__FILE__).parent.parent.parent.join('lib'))
    end

    it 'should set property lang to en' do
      Love.config
      expect(Love.lang).to eq('en')
    end

  end

  describe '#login_user' do

    before do
      $stdout.stub(:puts)
      HighLine.stub(:new) {
        mock = double('HighLine')
        mock.stub(:ask)
        mock
      }
    end

    it 'should ask user to login and create octokit client' do
      Love.login_user
      expect(Love.octokit.class).to eq(Octokit::Client)
    end

  end

  describe '#parse_gemfile' do

    it 'should run bundler to check current runtime and add gems from there' do
      pending
      expect(Bundler).to receive(:load)
      Love.parse_gemfile
    end

  end

  describe '#share_love' do

    it 'should trigger html generation if for site' do
      Love.config ['site']
      expect(Love::Share).to receive(:html)
      Love.share_love
    end

    it 'should trigger html generation if for gem' do
      Love.config
      expect(Love::Share).to receive(:md)
      Love.share_love
    end

  end

end
