<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Autode ja linnade register</title>

    <meta name="description" content="kodutöö: Autode ja linnade register">
    <meta name="author" content="MHPreiman, Martin Salu">
	
      <link href="<?php echo CSS_DIR;?>bootstrap.min.css" rel="stylesheet">
     <link href="<?php echo CSS_DIR;?>style.css" rel="stylesheet">

      <link href="<?php echo PLUG_DIR;?>datepicker\bootstrap-datepicker-1.6.4-dist\css\bootstrap-datepicker3.min.css" rel="stylesheet">
  </head>
  <body> 

<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="page-header">
				<h1>
                    Autode<small class="owr-small">_</small>linnade <small>register</small>
				</h1>
			</div>
        
			<div class="tabbable" id="tabs-326826">
				<ul class="nav nav-tabs">
					<li class="active">
						<a href="#panel-cars" data-toggle="tab">Autod</a>
					</li>
					<li>
						<a href="#panel-cities" data-toggle="tab">Linnad</a>
					</li>					
                    <li>
						<a href="#panel-logs" data-toggle="tab">Logi</a>
					</li>
				</ul>
				<div class="tab-content">
                <!-- CARS --><?php require_once('vaated/autod.php'); ?><!-- END: CARS -->
                    
                <!-- CITIES --><?php require_once('vaated/linnad.php'); ?><!-- END: CITIES -->
                    
                <!-- LOGS --> <?php require_once('vaated/logid.php'); ?><!-- END: LOGS -->
				</div>
			</div>
		</div>
	</div>
</div>
<script src="<?php echo JS_DIR;?>jquery.min.js"></script>
<script src="<?php echo JS_DIR;?>bootstrap.min.js"></script>
<script src="<?php echo JS_DIR;?>scripts.js"></script>
<script src="<?php echo PLUG_DIR;?>datepicker/bootstrap-datepicker-1.6.4-dist/js/bootstrap-datepicker.min.js"></script>
<script src="<?php echo JS_DIR;?>scripts.js"></script>
  </body>
</html>