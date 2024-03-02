module Helper
  class Trie

    attr_accessor :root

    def initialize
      self.root = TrieNode.new
    end

    def add(str)
      curr = self.root

      str.each_char do |ch|
        if curr.children.key?(ch)
          curr = curr.children[ch]
        else
          curr.children[ch] = TrieNode.new(ch)
          curr = curr.children[ch]
        end
      end

      curr.is_leaf = true
    end

    def nearest_match(str)
      curr = self.root

      str.each_char.with_index do |ch, ind|
        if curr.children.key?(ch)
          curr = curr.children[ch]
          return ind+1 if curr.is_leaf
        else
          return -1
        end
      end
    end

    private
      class TrieNode
        attr_accessor :children, :is_leaf, :val

        def initialize(val = nil)
          self.children = {}
          self.is_leaf = false
          self.val = val
        end

      end

  end
end
