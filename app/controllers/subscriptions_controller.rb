class SubscriptionsController < ApplicationController
  skip_before_action :verify_authenticity_token
 def webhook_callback
  # If the body contains the survey_name parameter...
  puts params
  puts request.format
  puts request.content_type
  respond_to do |format|
    format.json do
      puts 'JSON'
      render status: 200
    end
    format.html do
      puts 'HTML'
      render {key: 'just work!'}.as_json
    end
  end

 end

 def new_sub
   # @subscription = Subscription.new(params.require(:chargebee_id).permit(:chargebee_id))
   # @subscription.permited?s
   @subscription = Subscription.new(chargebee_id: params['chargebee_id'], user_id: 1)
   @subscription.save!
   @subscription.errors
   redirect_to subscriptions_path
 end

  def index
    @subscriptions = Subscription.all
  end

  def show
    @subscription = Subscription.find(params[:id])
    respond_to do |format|
      format.html {redirect_to "/subscriptions/#{@subscription.id}.pdf"}
      format.pdf do
        render pdf: "show",
        :save_to_file => Rails.root.join('app','assets','subscriptions_pdf', "Subscription #{@subscription.id}" + ".pdf")
      end
    end
  end

  def subscription_email
    subscription = Subscription.find(params[:id])
    SubscriptionsMailer.subscription_email(subscription).deliver
  end

    def new
      @subscription = Subscription.new
    end

    def create
      @subscription = Subscription.new(params.require(:subscription).permit(:id, :user, :sub_total, :vat, :total, :chargebee_id))

      respond_to do |format|
        if @subscription.save
          format.html { redirect_to subscriptions_path(@subscription), notice: 'Subscription added.'}
        else
          format.html { render :new}
          end
        end
    end

    def edit
      @subscription = Subscription.find(params[:id])
    end

    def update

      @subscription = Subscription.find(params[:id])
      respond_to do |format|
        if @subscription.update(params.require(:subscription).permit(:id, :paid_for, :chargebee_id))
          format.html { redirect_to @subscription, notice: 'Subscription updated.' }
        else
          format.html { render :edit }

        end
      end
    end


    def destroy
      @subscription = Subscription.find(params[:id])
      @subscription.destroy
      respond_to do |format|
        format.html { redirect_to subscriptions_path, notice: 'Your subscription was deleted.' }
        format.json { head :no_content }
    end
    end

  private

  def subscription_params
    params.require(:subscription).permit(:id, :paid_for, :subscription_id, :chargebee_id)
  end

  def set_link
      @subscription = Subscription.find(params[:id])
  end
end
