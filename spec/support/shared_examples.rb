# inspired on https://github.com/caskroom/rubocop-cask/blob/master/spec/support/cop_shared_examples.rb
# sed 's/inspired on/copied from/g
#
module SharedExamples
  shared_examples 'does not report any offenses' do
    it 'does not report any offenses' do
      expect_no_offenses(cop, source)
    end
  end

  shared_examples 'reports offenses' do
    it 'reports offenses' do
      expect_reported_offenses(cop, source, expected_offenses)
    end
  end

  shared_examples 'autocorrects source' do
    it 'autocorrects source' do
      expect_autocorrected_source(cop, source, correct_source)
    end
  end

  def expect_no_offenses(cop, source)
    inspect_source(source)
    expect(cop.offenses).to be_empty
  end

  def expect_reported_offenses(cop, source, expected_offenses)
    inspect_source(source)
    expect(cop.offenses.size).to eq(expected_offenses.size)
    expected_offenses.zip(cop.offenses).each do |expected, actual|
      expect_offense(expected, actual)
    end
  end

  # rubocop:disable Metrics/AbcSize
  def expect_offense(expected, actual)
    expect(actual.message).to eq(expected[:message])
    expect(actual.severity).to eq(expected[:severity])
    expect(actual.line).to eq(expected[:line])
    expect(actual.column).to eq(expected[:column])
    expect(actual.location.source).to eq(expected[:source])
  end

  def expect_autocorrected_source(cop, source, correct_source)
    new_source = autocorrect_source(cop, source)
    expect(new_source).to eq(Array(correct_source).join("\n"))
  end
end
