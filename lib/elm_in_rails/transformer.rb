require "elm-compiler"

module ElmInRails
  class Transformer
    ELM_MAKE_PATH = "#{`npm bin`.strip}/elm-make"

    class CompileError < StandardError; end

    def initialize(options = {})
      @options = options
    end

    def call(input)
      input_file = input[:filename]

      res =
      Dir.chdir(elm_package_root(input_file)) do
        ::Elm::Compiler.compile(input_file)
      end

      { data: res }
    end

    private

    def elm_package_root(file)
      dir = Pathname.new(file).dirname
      loop do
        elm_package = dir + "elm-package.json"
        return dir.to_s if elm_package.exist?

        fail "Could not find elm-package.json" if dir.to_s == "/"
        dir = dir.parent
      end
    end
  end
end
