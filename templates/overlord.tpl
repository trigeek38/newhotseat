{% extends "hotseat_base.tpl" %}

{% block main %}

<div class="block-aside" id="global-announce-message"></div>
{% if m.acl.is_admin %}
<div class="block-aside" id="subscribers">
    {% for subscriber in m.overlord.subscribers %}
        <div class="row-fluid">
            <div class="span12" id="subscriber-{{subscriber.user}}-{{ forloop.counter}}">
                {{ m.rsc[subscriber.user].title }}-{{subscriber.pid}}
                <a id="delete-subscriber-{{subscriber.user}}-{{forloop.counter}}" class="btn btn-mini pull-right" href="#">Remove</a>
            </div>
        </div>
        {% wire id=["delete-subscriber",subscriber.user, forloop.counter]|join:"-" action={postback postback={subscriber_delete pid=subscriber.pid userid=subscriber.user} delegate="mod_overlord" 
                                         action={remove target=["subscriber",subscriber.user,forloop.counter]|join:"-"}} %}
    {% endfor %}
</div>
<div class="block-aside" id="global-redirects">
  {% button text="Add-Me" class="btn btn-success" action={postback
                                                          postback={subscriber_put}
                                                          delegate="mod_overlord"}
  %}
  {% button text="Home" class="btn btn-success" action={postback 
                                                       postback={redirect dispatch="home"} 
                                                       delegate="hotseat"} 
  %}
  {% button text="Question List" class="btn btn-success" action={postback 
                                                       postback={redirect dispatch="question_list"} 
                                                       delegate="hotseat"}
  %}
  {% button text="Log-in" class="btn btn-warning" action={postback 
                                                       postback={redirect dispatch="logon"} 
                                                       delegate="hotseat"} 
  %}
  {% button text="Log-out" class="btn btn-warning" action={postback 
                                                       postback={redirect dispatch="logoff"} 
                                                       delegate="hotseat"} 
  %}
</div>
{% endif %}

{% endblock %}

{% block extra_footer %}
{% endblock %}

