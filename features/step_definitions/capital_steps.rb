Then(/^the remove modal should show the last saved capital$/) do
  expect(@page.delete_modal.body.text).to eq("#{@models.last.id} - #{@models.last.name}")
end

Then(/^the page should show the last saved capital$/) do
  actual = @page.form.fields.map{|f| f.value }
  expect(actual).to eq([@models.last.name])
end
