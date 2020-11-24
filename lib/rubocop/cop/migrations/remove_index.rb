module RuboCop
  module Cop
    module Migrations
      # Removing indexes is dangerous by nature, if the index you remove
      # is used extensively, you could end up with database degradation.
      #
      # This disallow the use of remove_index at all. It is only allowed
      # inside a down method definition. If you actually know what you are doing
      # (usually when the index is not being used) you should explicitly disable
      # the check by adding a ``rubocop:disable Migrations/RemoveIndex`` comment
      # in the offending line
      class RemoveIndex < Cop
        MSG = 'remove_index is disallowed'.freeze

        def_node_matcher :remove_index_found, '(:send _ :remove_index ...)'

        def on_send(node)
          remove_index_found(node) do
            node.each_ancestor do |a|
              next unless a.def_type?
              if a.to_s =~ /def :up/ || a.to_s =~ /def :change/
                add_offense(node, location: :selector, message: MSG)
              end
            end
          end
        end
      end
    end
  end
end
