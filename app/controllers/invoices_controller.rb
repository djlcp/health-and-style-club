class InvoicesController < ApplicationController

  def index
    @invoices = Invoice.all
  end

  def show
    @invoice = Invoice.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "show",
        :save_to_file => Rails.root.join('app','assets','invoices_pdf', "Invoice #{@invoice.id}" + ".pdf")
      end
    end
  end

  def invoice_email
    invoice = Invoice.find(params[:id])
    InvoicesMailer.invoice_email(invoice).deliver
  end



    def new
      @invoice = Invoice.new
    end

    def create
      @invoice = Invoice.new(params.require(:invoice).permit(:id, :user, :sub_total, :vat, :total))

      respond_to do |format|
        if @invoice.save
          format.html { redirect_to invoices_path(@invoice), notice: 'Invoice added.'}
        else
          format.html { render :new}
          end
        end
    end

    def edit
      @invoice = Invoice.find(params[:id])

    end

    def update
      @invoice = Invoice.find(params[:id])
      respond_to do |format|
        if @invoice.update(params.require(:invoice).permit(:id, :user, :sub_total, :vat, :total))
          format.html { redirect_to @invoice, notice: 'Invoice updated.' }
        else
          format.html { render :edit }

        end
      end
    end



    def destroy
      @invoice = Invoice.find(params[:id])
      @invoice.destroy
      respond_to do |format|
        format.html { redirect_to invoices_path, notice: 'Your invoice was deleted.' }
        format.json { head :no_content }

    end
    end

  private

  def invoice_params
    params.require(:invoice).permit(:id, :user, :sub_total, :vat, :total)
  end

  def set_link
      @invoice = Invoice.find(params[:id])
  end
end
