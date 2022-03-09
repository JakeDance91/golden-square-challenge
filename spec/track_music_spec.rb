require "track_music"

RSpec.describe Track_Music do

  it "returns artist and song as a pair" do
  music_library = Track_Music.new
  music_library.add_song("Tim Henson", "Blood moon")
  result = music_library.list 
  expect(result).to eq [{"Tim Henson" => "Blood moon"}]
  end

  it "returns error message when nothing is input" do
  music_library = Track_Music.new
  expect{ music_library.add_song("", "") }.to raise_error "No information given."
  end

  it "returns two tracks when two are input" do
  music_library = Track_Music.new
  music_library.add_song("Tim Henson", "Blood moon")
  music_library.add_song("Sikth", "Bland Street Bloom")
  result = music_library.list
  expect(result).to eq [{"Tim Henson" => "Blood moon"}, {"Sikth" => "Bland Street Bloom"}]
  end

  it "returns three tracks when two are input" do
  music_library = Track_Music.new
  music_library.add_song("Tim Henson", "Blood moon")
  music_library.add_song("Sikth", "Bland Street Bloom")
  music_library.add_song("DVBBS", "GOMF")
  result = music_library.list
  expect(result).to eq [{"Tim Henson" => "Blood moon"}, {"Sikth" => "Bland Street Bloom"}, {"DVBBS" => "GOMF"}]
  end
end  