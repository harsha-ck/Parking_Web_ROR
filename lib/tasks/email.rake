namespace :email do
  desc "Check and trigger duration exceeded emails"
  task duration_exceeded: :environment do
    customers = Customer.where(exit: nil)
    customers.each do |customer|
      entry = customer.entry
      if (Time.now - entry) >= 48.hours
        CustomerMailer.duration_exceeded(customer).deliver_now
      end
    end
  end
end
