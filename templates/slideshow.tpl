{% extends "hotseat_base.tpl" %}
{% block main %}
<div class="row-fluid">
  <div class="widget">
    <div class="widget-header">
      <i class="icon-desktop icon-3x"></i>
      <h3>Slideshow </h3>
    </div>
    <div class="widget-content">
      <div id="slide-content"> </div>
    </div>
  </div>
</div>
{% endblock %}
{% block sidebar %}
<div class="row-fluid">
  <div class="widget">
    <div id="subscribers-header" class="widget-header">
    {% wire id="subscribers-header" action={slide_toggle target="subscriber-list" speed="slow"} %}
      <i class="icon-group"></i>
      <h3>Registered Users </h3>
    </div>
    <div class="widget-content">
      <div id="slideshow-buttons">
        {% include "_slideshow_buttons.tpl" %}
      </div>
      <div id="subscriber-list">
       {% include "_subscriber_list.tpl" %}
      </div>
    </div>
    {% wire action={connect signal={refresh_subscriber_list} 
                    action={update target="subscriber-list" template="_subscriber_list.tpl"} 
                   }
    %}
  </div>
  <div class="widget">
    <div id="slides-header" class="widget-header">
    {% wire id="slides-header" action={slide_toggle target="slides-list" speed="slow"} %}
      <i class="icon-folder-open-alt"></i>
      <h3>Slides </h3>
    </div>
    <div id="slides-list" class="widget-content">
          {% with m.rsc[317].o.haspart as slides %}
             {% for slide in slides %}
             <div class="row-fluid">
               <div class="span12">{{ slide.title }}<a id="show-slide-{{slide.id}}" class="btn btn-mini pull-right" href="#">Show</a></div>

               {% wire id=["show-slide",slide.id]|join:"-" action={postback 
                                                                   postback= {update_slide target="slide-content" template="_slide_content.tpl" id=slide.id } 
                                                                   delegate="mod_overlord"}
               %}
             </div>
             {% endfor %}
          {% endwith %}
    </div>
  </div>
</div>
{% endblock %}

