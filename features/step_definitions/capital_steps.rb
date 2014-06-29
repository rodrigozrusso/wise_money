Then(/^the page should show the last saved capital$/) do
  actual = @page.form.fields.map{|f| f.value }
  expect(actual).to eq([@models.last.name])
end
