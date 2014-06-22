Entao(/^devo estar na listagem de transaction$/) do
  expect(Pages::TransactionIndex.new.displayed?).to be true
end
