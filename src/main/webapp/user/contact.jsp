<%-- 
    Document   : contact
    Created on : Oct 30, 2023, 12:15:49 AM
    Author     : Le Tan Kim
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <base href="http://localhost:8080/" />
        <link rel="icon" type="image/x-icon" href="./uploads/base/favicon.png">
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Contact us</title>
        <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
        <link rel="stylesheet" href="./user/assets/css/style.css" />
        <link rel="stylesheet" href="./user/assets/css/base.css" />
        <link rel="stylesheet" href="./user/assets/css/footer.css">
        <link rel="stylesheet" href="./user/assets/css/form.css">
        <link rel="stylesheet" href="./user/assets/css/contact.css">
        <link rel="stylesheet" href="./user/assets/css/responsive.css" />
    </head>
    <body>
        <%@include file="components/header.jsp" %>
        <c:set value="${companyBean.top1CompanyActive}" var="companyContact" />
        <main>
            <div class="page-banner-header" style="background-image: url('https://wphix.com/template/dukamarket/dukamarket/assets/img/banner/page-banner-3.jpg')">
                <div class="box-content-banner">
                    <h1>Contact us</h1>
                </div>
            </div>
            <div class="main-content-contact">
                <div class="container">
                    <div class="row">
                        <div class="col-12 col-md-6 col-lg-6">
                            <h2>Information of company</h2>
                            <ul class="list-contact">
                                <li class="item-contact">
                                    <span class="contact-title">
                                        Company: 
                                    </span>
                                    <span class="contact-content">${companyContact.name}</span>
                                </li>
                                <li class="item-contact">
                                    <span class="contact-title">
                                        Email: 
                                    </span>
                                    <span class="contact-content">${companyContact.email}</span>
                                </li>
                                <li class="item-contact">
                                    <span class="contact-title">
                                        Hotline: 
                                    </span>
                                    <span class="contact-content">${companyContact.phone}</span>
                                </li>
                                <li class="item-contact">
                                    <span class="contact-title">
                                        Address: 
                                    </span>
                                    <span class="contact-content">
                                        ${companyContact.address}
                                    </span>
                                </li>
                            </ul>
                            <div class="maps">
                                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d15716.21341654825!2d105.7149221395508!3d10.012451800000019!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31a0882139720a77%3A0x3916a227d0b95a64!2zVHLGsOG7nW5nIMSQ4bqhaSBo4buNYyBGUFQgQ-G6p24gVGjGoQ!5e0!3m2!1sen!2s!4v1696004380522!5m2!1sen!2s" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                            </div>
                        </div>
                        <div class="col-12 col-md-6 col-lg-6 box-send-message">
                            <h2>Send your message</h2>
                            <div class="wrapper-box-form">
                                <form action="/contact" method="post" id="form-contact">
                                    <div class="form-group">
                                        <label for="#name" class="form-label">Full name: </label>
                                        <input type="text" class="form-control" id="name" name = "fullname" placeholder="Full name">
                                        <span class="message_error"></span>
                                    </div>
                                    <div class="form-group">
                                        <label for="#email" class="form-label">Email: </label>
                                        <input type="text" class="form-control" id="email"  name = "email"  placeholder="Email">
                                        <span class="message_error"></span>
                                    </div>
                                    <div class="form-group">
                                        <label for="#phone" class="form-label">Phone: </label>
                                        <input type="text" class="form-control" id="phone" name = "phone"  placeholder="Phone">
                                        <span class="message_error"></span>
                                    </div>
                                    <div class="display-flex form-group">
                                        <label for="#message" class="form-label">Message: </label>
                                        <textarea class="form-control" name="message" id="message" cols="30" rows="10"></textarea>
                                        <span class="message_error"></span>
                                    </div>
                                    <button name="btn-send-contact" type="submit" class="btn btn-primary btn-send-contact">Send message</button>
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
        <script src="./user/assets/js/validator.js"></script>
        <script>
            const fullname = document.getElementById('name'),
                    email = document.getElementById('email'),
                    phone = document.getElementById('phone'),
                    message = document.getElementById('message');
            const messageMessage = "Message can not empty",
                    messageFullname = "Full name can not empty",
                    messageEmail = "Email is not valid. Ex: domain.@gmail.com",
                    messagePhone = "Phone is not valid. Ex: 0865341745";

            // array to save all input to check, message show error of each and a string regex to check 
            const inputsToValidate = [
                {element: fullname, message: messageFullname, regex: /^.{1,}$/},
                {element: email, message: messageEmail, regex: /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|.(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/},
                {element: phone, message: messagePhone, regex: /^[0][0-9]{9}$/},
                {element: message, message: messageMessage, regex: /^.{1,}$/}
            ];
            validation(inputsToValidate, document.querySelector(".btn-send-contact"));
        </script>
    </body>
</html>