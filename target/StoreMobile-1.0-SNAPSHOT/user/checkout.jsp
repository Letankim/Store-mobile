<%-- 
    Document   : checkout
    Created on : Oct 26, 2023, 11:29:42 AM
    Author     : Le Tan Kim
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="currency" scope="page" class="Util.CurrencyConverter"></jsp:useBean>
    <!DOCTYPE html>
    <html lang="en">
        <head>
            <meta charset="UTF-8">
            <base href="http://localhost:8080/" />
            <link rel="icon" type="image/x-icon" href="./uploads/base/favicon.png">
            <meta name="viewport" content="width=device-width, initial-scale=1.0" />
            <title>Check out</title>
            <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet"/>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
            <link rel="stylesheet" href="./user/assets/css/style.css" />
            <link rel="stylesheet" href="./user/assets/css/base.css" />
            <link rel="stylesheet" href="./user/assets/css/footer.css">
            <link rel="stylesheet" href="./user/assets/css/checkout.css">
            <link rel="stylesheet" href="./user/assets/css/responsive.css" />
        </head>
        <body>
        <%@include file="components/header.jsp" %>
        <main>
            <div class="container">
                <div class="wrapper-checkout row p-0">
                    <div class="col-12 col-md-6 col-lg-6 p-0 m-0">
                        <div class="box-ordered">
                            <h2 class="ordered-title">Your order</h2>
                            <div class="main-ordered">
                                <ul class="list-ordered">
                                    <li class="item-ordered">
                                        <p class="ordered-item-title">Product</p>
                                        <p class="ordered-item-title">Total</p>
                                    </li>
                                    <c:if test="${buyNow}">
                                        <c:set var="total" value="${product.newPrice > 0 ? product.newPrice * cartProductByNow.numberOfProduct : product.oldPrice * cartProductByNow.numberOfProduct}"/>
                                        <li class="item-ordered">
                                            <p class="ordered-item-title">
                                                ${product.name}
                                                <span class="number-of-ordered">x${cartProductByNow.numberOfProduct}</span>
                                                <span class="number-of-ordered">x${cartProductByNow.color}</span>
                                            </p>
                                            <p class="ordered-item-title">
                                                ${currency.currencyFormat(total, "VND")}
                                            </p>
                                        </li>
                                        <li class="item-ordered">
                                            <p class="ordered-item-title">
                                                Order total
                                            </p>
                                            <p class="ordered-item-title black-bold">${currency.currencyFormat(total, "VND")}</p>
                                        </li>
                                        <li class="item-ordered apply-voucher">

                                        </li>
                                    </c:if>
                                    <c:if test="${buyCart}">
                                        <c:set var="total" value="0" />
                                        <c:forEach items="${productsOrder}" var="p" varStatus="loopIndex">
                                            <li class="item-ordered">
                                                <p class="ordered-item-title">
                                                    ${p.name}
                                                    <span class="number-of-ordered">
                                                        x${numberProductsOrder.get(loopIndex.index).numberOfProduct}
                                                    </span>
                                                    <span class="number-of-ordered">
                                                        ${numberProductsOrder.get(loopIndex.index).color}
                                                    </span>
                                                </p>
                                                <c:if test="${p.newPrice > 0}">
                                                    <c:set var="totalItem" value="${numberProductsOrder.get(loopIndex.index).numberOfProduct * p.newPrice}" />
                                                    <p class="ordered-item-title">
                                                        ${currency.currencyFormat(totalItem, "VND")}
                                                    </p>
                                                    <c:set var="total" value="${total + totalItem}" />
                                                </c:if>
                                                <c:if test="${p.newPrice <= 0}">
                                                    <c:set var="totalItem" value="${numberProductsOrder.get(loopIndex.index).numberOfProduct * p.oldPrice}" />
                                                    <p class="ordered-item-title">
                                                        ${currency.currencyFormat(totalItem, "VND")}
                                                    </p>
                                                    <c:set var="total" value="${total + totalItem}" />
                                                </c:if>
                                            </li>
                                        </c:forEach>
                                        <li class="item-ordered">
                                            <p class="ordered-item-title">
                                                Order total
                                            </p>
                                            <p class="ordered-item-title black-bold">${currency.currencyFormat(total, "VND")}</p>
                                        </li>
                                        <li class="item-ordered apply-voucher">

                                        </li>
                                    </c:if>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <input type="hidden" value="${total}" class=" price-bill" />
                    <div class="col-12 col-md-6 col-lg-6 p-0 m-0">
                        <div class="box-info-ordered">
                            <h2 class="ordered-title">Billing Details</h2>
                            <div class="main-info-ordered"> 
                                <form action="/order" method="post" class="row m-0 p-0">
                                    <div class="form-group-ordered col-12 col-md-6 col-lg-6">
                                        <label for="#fullname">
                                            Full name: 
                                            <span class="required">*</span>
                                        </label>
                                        <input value="${accountUserLogin.fullname}" name="fullname" id="full-name" type="text" placeholder="Full name" required>
                                    </div>
                                    <div class="form-group-ordered col-12 col-md-6 col-lg-6">
                                        <label for="#email">
                                            Email: 
                                            <span class="required">*</span>
                                        </label>
                                        <input value="${accountUserLogin.email}" name="email" id="email" type="email" placeholder="Email" required>
                                    </div>
                                    <div class="form-group-ordered col-12 col-md-6 col-lg-6">
                                        <label for="#phone">
                                            Phone number: 
                                            <span class="required">*</span>
                                        </label>
                                        <input value="${accountUserLogin.phone}" name="phone" id="phone" type="text" placeholder="Phone number" required>
                                    </div>
                                    <div class="form-group-ordered col-12 col-md-6 col-lg-6">
                                        <label for="#province">
                                            Province / city:  
                                            <span class="required">*</span>
                                        </label>
                                        <select required name="province" id="province" onchange="filterAddress('#district', this.value)">
                                            <option value="">Choose  a province</option>
                                            <c:forEach items="${provinces}" var="province">
                                                <option value="${province.province_id}">${province.name}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="form-group-ordered col-12 col-md-6 col-lg-6">
                                        <label for="#district">
                                            District:  
                                            <span class="required">*</span>
                                        </label>
                                        <select required name="district" id="district" onchange="filterAddress('#ward', this.value)">
                                            <option value="">Choose  a district</option>
                                        </select>
                                    </div>
                                    <div class="form-group-ordered col-12 col-md-6 col-lg-6">
                                        <label for="#ward">
                                            Ward: 
                                            <span class="required">*</span>
                                        </label>
                                        <select required name="ward" id="ward">
                                            <option value="">Choose  a ward</option>

                                        </select>
                                    </div>
                                    <div class="form-group-ordered col-12 col-md-12 col-lg-12">
                                        <label  for="#details-address">
                                            Details address: 
                                            <span class="required">*</span>
                                        </label>
                                        <input name="details-address" id="details-address" type="text" placeholder="Details address" required>
                                    </div>

                                    <div class="form-group-ordered col-12 col-md-12 col-lg-12">
                                        <label  for="#details-address">
                                            Voucher: 
                                        </label>
                                        <c:if test="${accountUserLogin != null}">
                                            <div class="box-voucher">
                                                <input name="voucher" type="text" placeholder="Voucher code" class="voucher-apply-code">
                                                <input type="hidden" class="userId-user" value="${accountUserLogin.id}">
                                                <span class="btn btn-warning" onclick="applyVoucher(document.querySelector('.voucher-apply-code').value)">Apply</span>
                                            </div>
                                            <span class="message-voucher"></span>
                                        </c:if>
                                        <c:if test="${accountUserLogin == null}">
                                            <span class="message-login-user-voucher">
                                                <a href="auth/login">Login to using voucher </a>
                                            </span>
                                        </c:if>
                                    </div>

                                    <div class="form-group-ordered col-12 col-md-12 col-lg-12">
                                        <label for="#method-payment">
                                            Method payment: 
                                            <span class="required">*</span>
                                        </label>
                                        <div class="box-choose">
                                            <div class="group-pay">
                                                <input value="0" checked name="method-payment" id="cash-payment" type="radio" required>
                                                <label for="cash-payment">Cash</label>
                                            </div>
                                            <div class="desc-cash-method active">
                                                <p>
                                                    If you choose the COD payment method, in addition to the shipping fee, there will be an additional COD fee from the shipping service provider, so the fee when choosing this method will be more expensive.
                                                </p>
                                            </div>
                                            <div class="group-pay">
                                                <input value="1" name="method-payment" id="credit-payment" type="radio" required>
                                                <label for="credit-payment">Pay with VNPAY</label>
                                            </div>
                                            <div class="desc-credit-method">
                                                <p>Please note that you will receive a phone call confirming your order from the website after payment</p>
                                            </div>
                                        </div>
                                    </div>
                                    <c:if test="${buyNow}">
                                        <input type="hidden" name="productId" value="${product.ID}"/>
                                        <input type="hidden" name="numberOfProduct" value="${numberOfProduct}"/>
                                        <div class="box-btn-ordered">
                                            <button class="btn-submit-ordered" name="btn-order-now" type="submit">Order</button>
                                        </div>
                                    </c:if>
                                    <c:if test="${buyCart}">
                                        <button class="btn-submit-ordered" name="btn-order-cart">Order</button>
                                    </c:if>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <%@include file="components/footer.jsp" %>
        <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="./user/assets/js/app.js"></script>
        <script src="./user/assets/js/checkout.js"></script>
        <script>
                                                    const cashPay = document.querySelector("#cash-payment"),
                                                            creditPay = document.querySelector("#credit-payment"),
                                                            cashDesc = document.querySelector(".desc-cash-method"),
                                                            creditDesc = document.querySelector(".desc-credit-method");
                                                    cashPay.addEventListener("click", () => {
                                                        cashDesc.classList.add("active");
                                                        creditDesc.classList.remove("active");
                                                    })
                                                    creditPay.addEventListener("click", () => {
                                                        cashDesc.classList.remove("active");
                                                        creditDesc.classList.add("active");
                                                    })
        </script>
    </body>
</html>