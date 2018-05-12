<%-- 
    Document   : footer
    Created on : Jan 9, 2018, 6:16:39 PM
    Author     : SHUBHAM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
  <title>Footer</title>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:700,400&subset=cyrillic,latin,greek,vietnamese">
  <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="assets/mobirise/css/style.css">
  <link rel="stylesheet" href="assets/mobirise/css/mbr-additional.css" type="text/css">
<section class="mbr-section mbr-section-relative mbr-section-fixed-size" id="contacts3-n" data-rv-view="38" style="background-color: rgb(60, 60, 60);">    
    <div class="mbr-section__container container">
        <div class="mbr-contacts mbr-contacts-wysiwyg row" style="padding-top: 35px; padding-bottom: 35px;">
            <div class="col-sm-8">
                <div class="row">
                    <div class="col-sm-6">
                        <p class="mbr-contacts__text"><strong>ADDRESS</strong><br>31 Greater Vaishali<br>452009 Indore<br>M.P, India<br><br>
							<strong>CONTACTS</strong><br>
							Email: shubhamjain2908@gmail.com<br>
							Phone: +91 8871574375<br></p>
                    </div>
                    <div class="col-sm-6"><p><strong>Developer :</strong></p><p><strong>Shubham Jain</strong></p><p><strong><br></strong></p></div>
                </div>
            </div>
            <div class="mbr-contacts__column col-sm-4" data-form-type="formoid">
                <div data-form-alert="true">
                    <div class="hide" data-form-alert-success="true">Thanks for filling out form!</div>
                </div>
                <form name="feedb" data-form-title="MESSAGE">
                    <input type="hidden" value="" data-form-email="true">
                    
                    <div class="form-group">
                        <input type="email" id="ema" class="form-control input-sm input-inverse" name="email" required="" placeholder="Email*" data-form-field="Email">
                    </div>
                    
                    <div class="form-group">
                        <textarea class="form-control input-sm input-inverse" id="comm" name="comment" rows="4" placeholder="Message" data-form-field="Message"></textarea>
                    </div>
                    <div class="mbr-buttons mbr-buttons--right btn-inverse">
                        <button type="button"  class="mbr-buttons__btn btn btn-danger" onclick=" clear();sendFeedback();">CONTACT US</button><span id="feedba"></span>
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>