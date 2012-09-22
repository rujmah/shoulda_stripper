require 'spec_helper'
require 'shoulda_stripper'

describe 'build urls'  do

  let (:shouldafile) { ShouldaStripper::BuildUrls.new('test/test.rb') }
  it 'line count should be greater than 0' do
    shouldafile.lines.count.should_not eq(0)
  end

  it 'count the add_responses' do
    shouldafile.response_lines.count.should_not eq(0)
    shouldafile.response_lines.count.should eq(33)
  end
  it 'show the tab and text from 3rd add_response' do
    shouldafile.response_lines[3][:tabs].should  eq(3)
    shouldafile.response_lines[3][:response].should  eq(':amount')
  end
  it 'show the 3rd context result'
  it 'show nested contexts'

end
