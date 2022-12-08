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
    diaryentry = DiaryEntry.new("Wally", "Happy robot flying in space to go find other robot on spaceship")
    expect(diaryentry.reading_chunk(2,2)).to eq "Happy robot flying in"
    expect(diaryentry.reading_chunk(2,3)).to eq "space to go find other robot"
    expect(diaryentry.reading_chunk(2,1)).to eq "on spaceship"
    expect(diaryentry.reading_chunk(2,3)).to eq "Happy robot flying in space to"
  end

  it "returns string of text the user can read in a given number of minutes" do
    diaryentry = DiaryEntry.new("Monday", "This is a test sentence with ten different words in")
    expect(diaryentry.reading_chunk(2, 2)).to eq "This is a test" 
    expect(diaryentry.reading_chunk(2, 3)).to eq "sentence with ten different words in"
    expect(diaryentry.reading_chunk(2, 4)).to eq "This is a test sentence with ten different"
  end
end