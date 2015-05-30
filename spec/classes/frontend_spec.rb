require 'spec_helper'

describe 'spark::frontend::config', :type => 'class' do
  $test_os.each do |facts|
    os = facts['operatingsystem']
    path = $test_config_dir[os]

    context "on #{os}" do
      let(:facts) do
        facts
      end
      it { should compile.with_all_deps }
      it { should contain_file(path + '/spark-defaults.conf') }
      it { should contain_file('/etc/profile.d/hadoop-spark.sh') }
    end
  end
end

describe 'spark::frontend', :type => 'class' do
  $test_os.each do |facts|
    os = facts['operatingsystem']

    context "on #{os}" do
      let(:facts) do
        facts
      end
      it { should compile.with_all_deps }
      it { should contain_class('spark::frontend::install') }
      it { should contain_class('spark::frontend::config') }
    end
  end
end