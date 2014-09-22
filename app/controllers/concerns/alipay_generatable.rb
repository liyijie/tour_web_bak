# -*- coding: utf-8 -*-
module AlipayGeneratable
  extend ActiveSupport::Concern

  included do
    hide_action :generate_pay_link_by_order if respond_to?(:hide_action)
    helper_method :generate_pay_link_by_order
  end

  def generate_pay_link_by_order(order)
    options = {
        :out_trade_no      => order.token,
        :subject           => "#{order.ticket.title} 门票",
        :logistics_type    => 'DIRECT',
        :logistics_fee     => '0',
        :logistics_payment => 'SELLER_PAY',
        :price             => order.ticket.price,
        :quantity          => order.number,
        :discount          => 0,
        :return_url        => alipay_done_tour_order_url(order), # localhost isn't work http://bit.ly/1cwKbsw
        :notify_url        => alipay_notify_tour_order_url(order)
    }
    Alipay::Service.trade_create_by_buyer_url(options)
  end

  def generate_wap_pay_link_by_order order
    options = {
      :req_data => {
        :out_trade_no  =>  order.token,
        :subject       => "#{order.ticket.title} 门票",
        :total_fee     => order.total_price,
        :notify_url    => alipay_notify_tour_order_url(order),
        :call_back_url => tour_order_url(order)
      }
    }
    token = Alipay::Service::Wap.trade_create_direct_token(options)
    Alipay::Service::Wap.auth_and_execute(request_token: token)
  end
end
