module Either
  class Match

    def initialize
      @lefts = []
      @rights = []
    end

    def left pattern=always, &block
      @lefts << [(lambify pattern), block]
    end

    def right pattern=always, &block
      @rights << [(lambify pattern), block]
    end

    def evaluate(either)
      Evaluation.new(self, either).result
    end

    attr_reader :lefts, :rights

    private

    def lambify(pattern)
      pattern.is_a?(Proc) ? pattern : ->(x){ x == pattern }
    end

    def always
      ->(x) { true }
    end

    class Evaluation

      def initialize(match, either)
        @match  = match
        @either = either
      end

      attr_reader :match, :either

      def result
        either.left? ? left_result : right_result
      end

      private

      def left_result
        left_match.call(either.left.value)
      end

      def right_result
        right_match.call(either.right.value)
      end

      def left_match
        lefts.find { |pattern, _| either.left.select(&pattern).some? }.last
      end

      def right_match
        rights.find { |pattern, _| either.right.select(&pattern).some? }.last
      end

      def lefts
        match.lefts
      end

      def rights
        match.rights
      end

    end
  end
end
