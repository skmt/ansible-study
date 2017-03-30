require 'spec_helper'

describe package('bind'), :if => os[:family] == 'redhat' do
  it { should be_installed }
end

describe package('bind'), :if => os[:family] == 'amazon' do
  it { should be_installed }
end

describe service('named'), :if => os[:family] == 'redhat' do
  it { should be_enabled }
  it { should be_running }
end

describe service('named'), :if => os[:family] == 'amazon' do
  it { should be_enabled }
  it { should be_running }
end

describe port(53) do
  it { should be_listening }
end

describe host('google-public-dns-a.google.com') do
  its(:ipv4_address) { should eq '8.8.8.8' }
end

describe host('google-public-dns-b.google.com') do
  its(:ipv4_address) { should eq '8.8.4.4' }
end
