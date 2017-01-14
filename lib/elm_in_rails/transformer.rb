require "elm-compiler"

module ElmInRails
  class Transformer
    def initialize(options = {})
      @options = options
    end

    def call(input)
      input_file = input[:filename]
      dependencies = Set.new input[:dependencies]

      compiled_elm =
        Dir.chdir(elm_package_root(input_file)) do
          ::Elm::Compiler.compile(input_file)
        end

      Dir.glob("#{input[:load_path]}/**/*.elm")
        .reject { |dep| dep.include? 'elm-stuff' }
        .each do |dep|
          _, deps = input[:environment].resolve! dep
          dependencies.merge deps
        end

      { data: compiled_elm,
        dependencies: dependencies }
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
