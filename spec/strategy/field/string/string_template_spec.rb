require "spec_helper"

describe FieldStrategy::StringTemplate do

  StringTemplate = FieldStrategy::StringTemplate
  let(:field) { DataAnon::Core::Field.new('state', 'New Delhi', 3456, nil) }

  describe 'should return same string value as StringTemplate' do
    let(:anonymized_value) { StringTemplate.new('Sunit #{row_number} Parekh').anonymize(field) }
    it { anonymized_value.should == 'Sunit 3456 Parekh' }
  end



end