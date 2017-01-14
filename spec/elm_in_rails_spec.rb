require "spec_helper"
require 'sprockets'
require 'elm_in_rails'

describe ElmInRails do
  it 'compiles elm with Elm::Compiler' do
    environment = Sprockets::Environment.new
    environment.append_path File.expand_path("../fixtures", __FILE__)

    expect(Elm::Compiler).to receive(:compile) { 'stubbed' }

    elm_source = File.read(File.expand_path("../fixtures/Main.elm", __FILE__))
    input = {
      environment: environment,
      content_type: 'application/x-elm',
      data: elm_source,
      metadata: {},
      load_path: File.expand_path("../fixtures", __FILE__),
      filename: File.expand_path("../fixtures/Main.elm", __FILE__),
      cache: Sprockets::Cache.new
    }

    transformed = ElmInRails::Transformer.new.call(input)

    expect(transformed[:data]).to eq 'stubbed'
  end

  it 'adds all elm files in same directory and subdirectories as dependencies' do
    environment = Sprockets::Environment.new
    environment.append_path File.expand_path("../fixtures", __FILE__)

    expect(Elm::Compiler).to receive(:compile) { 'stubbed' }

    elm_source = File.read(File.expand_path("../fixtures/Main.elm", __FILE__))
    input = {
      environment: environment,
      content_type: 'application/x-elm',
      data: elm_source,
      metadata: {},
      load_path: File.expand_path("../fixtures", __FILE__),
      filename: File.expand_path("../fixtures/Main.elm", __FILE__),
      cache: Sprockets::Cache.new
    }

    transformed = ElmInRails::Transformer.new.call(input)

    dependencies =
      ["file-digest:///home/masa331/pracovni/code/ruby/elm_in_rails/spec/fixtures/Main.elm",
       "file-digest:///home/masa331/pracovni/code/ruby/elm_in_rails/spec/fixtures/subdirectory/AnotherDependency.elm",
       "file-digest:///home/masa331/pracovni/code/ruby/elm_in_rails/spec/fixtures/Dependency.elm"]

    expect(transformed[:dependencies].to_a).to match_array dependencies
  end
end
