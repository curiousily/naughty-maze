When /^I check if cell (\d+) is in the maze$/ do |cell|
  @cell = cell
end

Then /^It should not be in it$/ do
  @maze.include?(@cell).should == false
end
Then /^It should be in it$/ do
  @maze.include?(@cell).should == true
end