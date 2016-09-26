require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', 'spec_helper'))
describe RuboCop::Cop::Migrations::RemoveIndex do
  include SharedExamples
  subject(:cop) { described_class.new }

  context 'when there is a remove_index' do
    context 'in the up method' do
      let(:source) do
        <<-MIGRATION
          class RemoveSomeIndex < ActiveRecord::Migration
            def up
              remove_index :some_table, :some_index
            end
          end
        MIGRATION
      end

      let(:expected_offenses) do
        [
          {
            message: 'remove_index is disallowed',
            severity: :convention,
            line: 3,
            column: 14,
            source: 'remove_index'
          }
        ]
      end

      include_examples 'reports offenses'

      context 'using method_call syntax' do
        let(:source) do
          <<-MIGRATION
          class RemoveSomeIndex < ActiveRecord::Migration
            def up
              change_table :some_table do |m|
                m.remove_index [:some_index]
              end
            end
          end
        MIGRATION
        end
        let(:expected_offenses) do
          [
            {
              message: 'remove_index is disallowed',
              severity: :convention,
              line: 4,
              column: 18,
              source: 'remove_index'
            }
          ]
        end
        include_examples 'reports offenses'
      end
    end

    context 'in the change method' do
      let(:source) do
        <<-MIGRATION
          class RemoveSomeIndex < ActiveRecord::Migration
            def change
              remove_index :some_table, :some_index
            end
          end
        MIGRATION

      end
      let(:expected_offenses) do
        [
          {
            message: 'remove_index is disallowed',
            severity: :convention,
            line: 3,
            column: 14,
            source: 'remove_index'
          }
        ]
      end

      include_examples 'reports offenses'
    end

    context 'in the down method' do
      let(:source) do
          <<-MIGRATION
          class RemoveSomeIndex < ActiveRecord::Migration
            def down
              remove_index :some_table, :some_index
            end
          end
        MIGRATION
      end

      include_examples 'does not report any offenses'
    end

  end
end
