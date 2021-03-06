package com.sell.service;

import com.sell.dto.OrderDTO;

public interface BuyerService {

    //查询订单
    OrderDTO findOrderOne(String openid,String orderId);

    //取消订单
    OrderDTO cancelOrder(String openid,String orderId);
}
