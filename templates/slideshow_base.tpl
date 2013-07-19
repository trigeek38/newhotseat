<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Template &middot; Bootstrap</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Le styles -->
   {% lib
         "bootstrap/css/bootstrap.css"
         "bootstrap/css/bootstrap-responsive.css"
         "bootstrap/css/bootstrap-base-site.css"
         "css/font-awesome.css"
         "css/z.growl.css"
         "css/z.modal.css"
         "css/site.css"
    %}
    <style type="text/css">
      body {
        padding-top: 20px;
        padding-bottom: 40px;
      }

      /* Custom container */
      .container-narrow {
        margin: 0 auto;
        max-width: 900px;
      }
      .container-narrow > hr {
        margin: 30px 0;
      }

      /* Main marketing message and sign up button */
      .jumbotron {
        margin: 60px 0;
        text-align: center;
      }
      .jumbotron h1 {
        font-size: 72px;
        line-height: 1;
      }
      .jumbotron .btn {
        font-size: 21px;
        padding: 14px 24px;
      }

      /* Supporting marketing content */
      .marketing {
        margin: 60px 0;
      }
      .marketing p + h4 {
        margin-top: 28px;
      }
    </style>

    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="../assets/js/html5shiv.js"></script>
    <![endif]-->

  </head>

  <body>

    <div class="container-narrow">

      <div class="masthead">
        <div id="slideshow-buttons">
          {% include "_slideshow_buttons.tpl" %}
        </div>
        <h3 class="muted">Follow-along Slideshow</h3>

      </div>

      <hr>


      <div class="row-fluid marketing">
        <div class="span12" id="slide-content"> 
      <div class="jumbotron">
        <h1>Super Slideshow!</h1>
      </div>
          <div class="progress progress-striped active">
            <div class="bar" style="width: 40%;">Waiting to start slideshow...</div>
          </div>
        </div>
      </div>

      <hr>

      <div class="footer">
        <p>&copy; Company 2013</p>
      </div>

    </div> <!-- /container -->

    {% include "_js_include.tpl" %}
    {% stream %}
    {% script %}
  </body>
</html>
