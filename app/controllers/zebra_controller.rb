class ZebraController < ApplicationController

  def home
    render({:template => "calc_views/home"})
  end

  def square_new
    render({:template => "calc_views/square_new"})
  end

  def square_result
    @user_number = params.fetch("number").to_f
    square = @user_number * @user_number
    @number_square = square.round(4)
    render({:template => "calc_views/square_result"})
  end

  def square_root_new
    render({:template => "calc_views/square_root_new"})
  end

  def square_root_results
    @user_number = params.fetch("user_number").to_f
    @square_rt = Math.sqrt(@user_number)
    render({:template => "calc_views/square_root_results"})
  end

  def payment_new
    render({:template => "calc_views/payment_new"})
  end

  def payment_results
    @ap_rate = params.fetch("user_apr").to_f
    @ap_rate_formatted = @ap_rate.to_fs(:percentage, {:precision => 4})
    @number_of_years = params.fetch("user_years").to_i
    number_of_months = @number_of_years * 12
    @principal_amount = params.fetch("user_principal").to_f
    @principal_amount_formatted = @principal_amount.to_fs(:currency)
  
    r = @ap_rate / 1200
  
    numerator = r * @principal_amount
    denominator = 1 - (1 + r)**-number_of_months
    @payment = numerator / denominator
    @payment_formatted = @payment.to_fs(:currency)

    render({:template=> "calc_views/payment_results"})
  end

  def random_new
    render({:template => "calc_views/random_new"})
  end

  def random_results
    @min_num_pick = params.fetch("min_num").to_f
    @max_num_pick = params.fetch("max_num").to_f
    @random_number = rand(@min_num_pick..@max_num_pick).to_f
    render ({:template => "calc_views/random_results"})
  end
end
