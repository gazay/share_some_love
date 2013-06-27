require 'spec_helper'

describe Love do

  describe '#config' do

    it 'should set property by_gemname to true if there arg by_gem' do
      Love.config ['by_gem']
      Love.by_gemname.should be_true
    end

    it 'should set property by_gemname to false if there no arg by_gem' do
      Love.config
      Love.by_gemname.should be_false
    end

    it 'should set property for_site to true if there arg site' do
      Love.config ['site']
      Love.for_site.should be_true
    end

    it 'should set property for_site to false if there no arg site' do
      Love.config
      Love.for_site.should be_false
    end

    it 'should set property check_author to true if there arg -v' do
      Love.config ['-v']
      Love.check_author.should be_true
    end

    it 'should set property check_author to false if there no arg -v' do
      Love.config
      Love.check_author.should be_false
    end

    it 'should set property root to lib folder' do
      Love.config
      Love.root.should == Pathname(__FILE__).parent.parent.parent.join('lib')
    end

    it 'should set property lang to en' do
      Love.config
      Love.lang.should == 'en'
    end

  end

  describe '#login_user' do

    it 'should ask user to login and create octokit client' do
      STDIN.should_receive(:gets).twice.and_return 'dummy'
      STDOUT.should_receive(:puts).exactly(3).times
      Love.login_user
      Love.octokit.class.should == Octokit::Client
    end

  end

  describe '#parse_gemfile' do

    it 'should run bundler to check current runtime and add gems from there' do
      pending
      Bundler.should_receive(:load)
      Love.parse_gemfile
    end

  end

  describe '#share_love' do

    it 'should trigger html generation if for site' do
      Love.config ['site']
      Love::Share.should_receive(:html)
      Love.share_love
    end

    it 'should trigger html generation if for gem' do
      Love.config
      Love::Share.should_receive(:md)
      Love.share_love
    end

  end

end
