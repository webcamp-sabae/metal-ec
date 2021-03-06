class Admins::PurchasesController < Admins::AdminsController

  def index
    @term = Purchase.ransack(params[:q])
    @purchases = @term.result
    @total_price = total_price_by(@purchases).to_s(:delimited)
    @total_amount = total_amount_by(@purchases)
    @total_users = total_users_by(@purchases)
  end

  private

    def total_price_by(purchases)
      purchases.map(&:total_price).sum
    end

    def total_amount_by(purchases)
      purchases.map(&:amount).sum
    end

    def total_users_by(purchases)
      purchases.map(&:active_user).uniq.count
    end
end
