<ul class="nav nav-pills">
  {% if m.overlord.is_subscribed %}
    <li id="stop-following" class="active"><a href="#">Stop Following</a></li>
      {% wire id="stop-following" action={ postback postback={ subscriber_delete } 
                                           action={ update target="slideshow-buttons" template="_slideshow_buttons.tpl" }
                                           delegate="mod_overlord" } %}
  {% else %}
    <li id="start-following" class="active"> <a href="#">Follow</a> </li>
      {% wire id="start-following" action={ postback postback={ subscriber_put } 
                                            action={ update target="slideshow-buttons" template="_slideshow_buttons.tpl" }
                                            delegate="mod_overlord" } %}
  {% endif %}
</ul>
