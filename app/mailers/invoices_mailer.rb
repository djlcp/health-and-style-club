class InvoicesMailer < ActionMailer::Base
  # def invoice_email(invoice_id)
  #   invoice = Invoice.find(invoice_id)
  #   attachments["Invoice #{invoice.id}.pdf"] = WickedPdf.new.pdf_from_string(
  #     render_to_string(pdf: "show"),
  #   )
  #   mail(to: invoice.user.email, subject: 'Your invoice PDF is attached', invoice: invoice)
  # end

  def invoice_email(invoice)
    @invoice = invoice
    user = User.find(@invoice.user)
    mail(:subject => "Health & Style Club Invoice #{invoice.id}", :to => user.email) do |format|
      format.pdf do
        attachments['invoice.pdf'] = WickedPdf.new.pdf_from_string(
          render_to_string(:pdf => "invoice",:template => 'invoices/show.pdf.erb')
        )
      end
    end
  end
end
