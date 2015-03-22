require 'spec_helper'

describe 'yara::default' do
  yara_rule_test = %{echo 'rule dummy { condition: true }' > my_first_rule && yara my_first_rule my_first_rule}

  describe command(yara_rule_test) do
    its(:exit_status) { should eq 0 }
  end
end
