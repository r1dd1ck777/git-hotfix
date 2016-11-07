module Context
  class Br
    class << self
      def current
        `git rev-parse --abbrev-ref HEAD`.gsub("\n", '')
      end

      def list
        raw_list.map{|b| b.gsub('*', '').strip }
      end

      def exists? name
        list.include? name
      end

      def task_name
        if current
          r = current.scan(/\/([^\/]+)/)
          r = r[0][0] if r
          r
        else
          nil
        end
      end

      protected

      def raw_list
        list = `git branch`
        list.split("\n")
      end
    end
  end

  class Code
    class << self
      def has_changes?
        status = `git status`
        !status.include? 'nothing to commit, working directory clean'
      end
    end
  end
end