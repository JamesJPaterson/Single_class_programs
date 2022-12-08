require "diary_entry"

RSpec.describe "diary_entry" do
  it "returns the contents" do
    p = DiaryEntry.new("Wally", "Robot")
    expect(p.title).to eq "Wally"
  end

  it "returns the contents" do
    p = DiaryEntry.new("Wally", "Robot")
    expect(p.contents).to eq "Robot"
  end

  it "returns the word count of the contents" do
    p = DiaryEntry.new("Wally", "Happy robot")
    expect(p.count_words).to eq 2
  end

  it "returns an integer for how long it will take to read" do
    p = DiaryEntry.new("Wally", "Happy robot flying in space")
    expect(p.reading_time(2)).to eq 3
  end

  it "returns a chunk of the contents that the user can read" do
    p = DiaryEntry.new("Wally", "Happy robot flying in space to go find other robot on spaceship")
    expect(p.reading_chunk(2,2)).to eq "Happy robot flying in"
    expect(p.reading_chunk(2,3)).to eq "space to go find other robot"
  end
end