class SubscriptionsController < ApplicationController


# def subscription_created_callback
#   # If the body contains the survey_name parameter...
#   if params[:subscription_name].present?
#     # Create a new Survey object based on the received parameters...
#     subscription = Subscription.new(:name => params[:subscription_name]
#     subscription.url = params[:subscription_url]
#     subscription.creator_email = params[:subscription_creator_email]
#     subscription.save!
#   end

  # The webhook doesn't require a response but let's make sure
  # we don't send anything
#   render :nothing => true
# end

  def index
    # respond_to do |format|
      @subscriptions = Subscription.all
      @user_id = current_user.id
      # format.json do
    #     render json: @subscriptions
    #   end
    # end
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
      @subscription = Subscription.new(params.require(:subscription).permit(:id, :user, :sub_total, :vat, :total))

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
      puts 'hello'
      @subscription = Subscription.find(params[:id])
      respond_to do |format|
        if @subscription.update(params.require(:subscription).permit(:id, :paid_for))
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
    params.require(:subscription).permit(:id, :user, :sub_total, :vat, :total)
  end

  def set_link
      @subscription = Subscription.find(params[:id])
  end
end
