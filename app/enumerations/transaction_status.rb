class TransactionStatus < EnumerateIt::Base
  associate_values(
    to_confirm: 1,
    confirmed: 2
  )
end
