class CustomerMailer < ApplicationMailer
<<<<<<< HEAD
default from: '<your gmail>'
=======
default from: '<your email>'
>>>>>>> b622d27b16a361fb43eafc9a408827f6aa1c14b2
 def duration_exceeded(customer)
    @customer = customer
        mail(to: @customer.email, subject: "Your parked vehicle duration has exceeded 2 days")
 end

 def invoice(customer)
    @customer = customer
     attachments["invoice_#{@customer.id}.pdf"] = generate_pdf
        mail(to: @customer.email, subject: 'Your Invoice')

 end
 def generate_pdf
   Prawn::Document.new do |pdf|
     pdf.text "Invoice for #{@customer.vnum}", align: :center, size: 22, style: :bold
     pdf.move_down 20
     pdf.indent(20) do
       pdf.text "Email: #{@customer.email}"
       pdf.text "Vehicle Type: #{@customer.vtype}"
       pdf.text "Vehicle Number: #{@customer.vnum}"
       pdf.text "Vehicle Price: #{@customer.price}"
       pdf.text "Entry Time: #{@customer.entry}"
       pdf.text "Exit Time: #{@customer.exit}"
     end

   end.render

   end
end
