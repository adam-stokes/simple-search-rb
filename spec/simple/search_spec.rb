RSpec.describe Simple::Search do
  it "has a version number" do
    expect(Simple::Search::VERSION).not_to be nil
  end

  it "normalizes a string" do
    string = "The broken window shatters across the ground!"
    expected = "the broken window shatters across the ground"
    expect(Simple::Search::normalize(string)).to eq(expected)
  end

  it "has the correct word frequency count" do
    string = "There is that one person and only that one person"
    record = Simple::Search::Record.new(string)

    expect(record.term_frequency["person"]).to eq(2)
    expect(record.term_frequency["there"]).to eq(1)
  end

  it "finds correct results" do
    store = Simple::Search::Store.new()
    Simple::Search::QUOTES.each do |record|
      store.add(record)
    end

    expect(store.search("GrEaTeST").count).to eq(1)
    expect(store.search("life").count).to eq(4)
    expect(store.search("life!").count).to eq(4)
    expect(store.search(",life,").count).to eq(4)

  end
end
