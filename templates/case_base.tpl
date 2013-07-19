<!DOCTYPE html>
<html lang="{{ z_language|default:"en"|escape }}">
<head>
	<meta charset="utf-8" />
	<title>{% block title %}{{ id.title }}{% endblock %} &mdash; {{ m.config.site.title.value }}</title>

	<link rel="icon" href="/favicon.ico" type="image/x-icon" />
	<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />

	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<meta name="author" content="Marc Worrell" />

	{% all include "_html_head.tpl" %}
	{% lib 
	        "bootstrap/css/bootstrap.css" 
	        "bootstrap/css/bootstrap-responsive.css" 
	        "css/jquery.loadmask.css" 
	        "css/z.growl.css" 
	        "css/z.modal.css" 
	%}
        {% lib "css/site.css" %}
{% block html_head_extra %}{% endblock %}
<style>

.choice {
  margin-bottom: 5px;
  background-color: #eeeee0;
}

.widget {
	
	position: relative;
	clear: both;
	
	width: auto;
	
	margin-bottom: 2em;
		
	overflow: hidden;
}
	
.widget-header {
	
	position: relative;
	
	height: 40px;
	line-height: 40px;
	
	background: #E9E9E9;
	background:-moz-linear-gradient(top, #FAFAFA 0%, #E9E9E9 100%); /* FF3.6+ */
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0%,#FAFAFA), color-stop(100%,#E9E9E9)); /* Chrome,Safari4+ */
	background:-webkit-linear-gradient(top, #FAFAFA 0%,#E9E9E9 100%); /* Chrome10+,Safari5.1+ */
	background:-o-linear-gradient(top, #FAFAFA 0%,#E9E9E9 100%); /* Opera11.10+ */
	background:-ms-linear-gradient(top, #FAFAFA 0%,#E9E9E9 100%); /* IE10+ */
	background:linear-gradient(top, #FAFAFA 0%,#E9E9E9 100%); /* W3C */
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#FAFAFA', endColorstr='#E9E9E9');
	-ms-filter: "progid:DXImageTransform.Microsoft.gradient(startColorstr='#FAFAFA', endColorstr='#E9E9E9')";
	
	
	border: 1px solid #D5D5D5;
	
	-webkit-border-top-left-radius: 4px;
	-webkit-border-top-right-radius: 4px;
	-moz-border-radius-topleft: 4px;
	-moz-border-radius-topright: 4px;
	border-top-left-radius: 4px;
	border-top-right-radius: 4px;
	
	-webkit-background-clip: padding-box;
}	
	
	.widget-header h3 {
		
		position: relative;
		top: 2px;
		left: 10px;
		
		display: inline-block;
		margin-right: 3em;
		
		font-size: 14px;
		font-weight: 800;
		color: #555;
		line-height: 18px;
		
		text-shadow: 1px 1px 2px rgba(255,255,255,.5);
	}
	
		.widget-header [class^="icon-"], .widget-header [class*=" icon-"] {
			
			display: inline-block;
			margin-left: 13px;
			margin-right: -2px;
			
			font-size: 16px;
			color: #555;
			vertical-align: middle;
			
			
			
		}




.widget-content {
	padding: 20px 15px 15px;
	
	background: #FFF;
	
	
	border: 1px solid #D5D5D5;
	
	-moz-border-radius: 5px;
	-webkit-border-radius: 5px;
	border-radius: 5px;
}

.widget-header+.widget-content {
	border-top: none;
	
	-webkit-border-top-left-radius: 0;
	-webkit-border-top-right-radius: 0;
	-moz-border-radius-topleft: 0;
	-moz-border-radius-topright: 0;
	border-top-left-radius: 0;
	border-top-right-radius: 0;
}

.widget-nopad .widget-content {
	padding: 0;
}

/* Widget Content Clearfix */	
.widget-content:before,
.widget-content:after {
    content:"";
    display:table;
}

.widget-content:after {
    clear:both;
}

/* For IE 6/7 (trigger hasLayout) */
.widget-content {
    zoom:1;
}

/* Widget Table */

.widget-table .widget-content {
	padding: 0;
}

.widget-table .table {
	margin-bottom: 0;
	
	border: none;
}

.widget-table .table tr td:first-child {
	border-left: none;
}

.widget-table .table tr th:first-child {
	border-left: none;
}


/* Widget Plain */

.widget-plain {
	
	background: transparent;
	
	border: none;
}

.widget-plain .widget-content {
	padding: 0;
	
	background: transparent;
	
	border: none;
}


/* Widget Box */

.widget-box {	
	
}

.widget-box .widget-content {	
	background: #E3E3E3;	
	background: #FFF;
}


</style>
</head>

<body class="{% block page_class %}{% endblock %}">
{% block navbar %}
	{% include "_navbar.tpl" %}
{% endblock %}
<div class="container-fluid">
	{% block content_area %}
		<div class="content" {% include "_language_attrs.tpl" language=z_language %}></div>
		{% block content %}
			{% block above %}
			<div class="page-title row">
				<div class="{% if z_language|is_rtl %}span8{% endif %}">
				</div>
			</div>
			{% endblock %}
			<div class="row-fluid">
                                <div class="span3">{% block sidebar %}{% endblock %}</div>
				<div class="span8">
					{% block main %}{% endblock %}
				</div>
			</div>
			{% block below %}{% endblock %}
		{% endblock %}
	{% endblock %}
	{% include "_footer.tpl" %}
</div>
  {% wire action={connect signal={display_announcement_message}
          action={dialog_close}
          action={dialog_open title="Proctor Message" template="_global_announcement_message.tpl"}
          }
  %}


{% include "_js_include.tpl" %}
{% stream %}
{% script %}

{% block ua_probe %}
	{% include "_ua_probe.tpl"%}
{% endblock %}
</body>
</html>
