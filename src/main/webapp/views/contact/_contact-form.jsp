<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="send-message">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="section-heading">
                    <h2>Send us a Message</h2>
                </div>
            </div>
            <div class="col-md-8">
                <div class="contact-form">
                    <form id="contact" action="/contact/sent" method="post" enctype="multipart/form-data">
                        <div class="row">

                            <div class="col-lg-12 col-md-12 col-sm-12">
                                <fieldset>
                                    <input name="fullName" type="text" class="form-control" id="name"
                                           placeholder="Full Name" required="">
                                </fieldset>
                            </div>
                            <div class="col-lg-12 col-md-12 col-sm-12">
                                <fieldset>
                                    <input name="to" type="text" class="form-control" id="email"
                                           placeholder="E-Mail Address"
                                           required="">
                                </fieldset>
                            </div>
                            <div class="col-lg-12 col-md-12 col-sm-12">
                                <fieldset>
                                    <input name="subject" type="text" class="form-control" id="subject"
                                           placeholder="Subject"
                                           required="">
                                </fieldset>
                            </div>
                            <div class="input-group mb-4 col-sm-6">
                                <div class="input-group-prepend">
                  <span class="input-group-text" id="inputGroupFileAddon01">
                                      <i class="fa fa-paperclip"></i>

                  </span>
                                </div>
                                <div class="custom-file">
                                    <input type="file" class="custom-file-input" id="inputGroupFile01"
                                           multiple="multiple" name="attachments">
                                    <label class="custom-file-label" for="inputGroupFile01">Choose file</label>
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <fieldset>
                    <textarea name="body" rows="6" class="form-control" id="message" placeholder="Your Message"
                              required=""></textarea>
                                </fieldset>
                            </div>
                            <div class="col-lg-6">
                                <fieldset>
                                    <button type="submit" id="form-submit" class="filled-button">Send Message</button>
                                    <t1>${message}</t1>
                                </fieldset>

                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="col-md-4">
                <ul class="accordion">
                    <li>
                        <a>Accordion Title One</a>
                        <div class="content">
                            <p>Lorem ipsum dolor sit amet, consectetur adipisic elit. Sed voluptate nihil eumester
                                consectetur
                                similiqu consectetur.<br><br>Lorem ipsum dolor sit amet, consectetur adipisic elit. Et,
                                consequuntur,
                                modi mollitia corporis ipsa voluptate corrupti elite.</p>
                        </div>
                    </li>
                    <li>
                        <a>Second Title Here</a>
                        <div class="content">
                            <p>Lorem ipsum dolor sit amet, consectetur adipisic elit. Sed voluptate nihil eumester
                                consectetur
                                similiqu consectetur.<br><br>Lorem ipsum dolor sit amet, consectetur adipisic elit. Et,
                                consequuntur,
                                modi mollitia corporis ipsa voluptate corrupti elite.</p>
                        </div>
                    </li>
                    <li>
                        <a>Accordion Title Three</a>
                        <div class="content">
                            <p>Lorem ipsum dolor sit amet, consectetur adipisic elit. Sed voluptate nihil eumester
                                consectetur
                                similiqu consectetur.<br><br>Lorem ipsum dolor sit amet, consectetur adipisic elit. Et,
                                consequuntur,
                                modi mollitia corporis ipsa voluptate corrupti elite.</p>
                        </div>
                    </li>
                    <li>
                        <a>Fourth Accordion Title</a>
                        <div class="content">
                            <p>Lorem ipsum dolor sit amet, consectetur adipisic elit. Sed voluptate nihil eumester
                                consectetur
                                similiqu consectetur.<br><br>Lorem ipsum dolor sit amet, consectetur adipisic elit. Et,
                                consequuntur,
                                modi mollitia corporis ipsa voluptate corrupti elite.</p>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
