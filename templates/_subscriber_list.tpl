        {% for subscriber in m.overlord.subscribers %}
        <div class="row-fluid">
            <div class="span12" id="subscriber-{{subscriber.user}}-{{ forloop.counter}}">
                {% if m.rsc[subscriber.user].title|is_undefined %}
                  Guest
                {% else %}
                  {{ m.rsc[subscriber.user].title }}
                {% endif %}
                -{{subscriber.pid}}
                <a id="delete-subscriber-{{subscriber.user}}-{{forloop.counter}}" class="btn btn-mini pull-right" href="#">Remove</a>
                <a id="message-subscriber-{{subscriber.user}}-{{forloop.counter}}" class="btn btn-mini pull-right" href="#">Message</a>
            </div>
             {% wire id=["delete-subscriber",subscriber.user, forloop.counter]|join:"-"
                action={postback postback={subscriber_delete pid=subscriber.pid userid=subscriber.user} delegate="mod_overlord"
                action={remove target=["subscriber",subscriber.user,forloop.counter]|join:"-"}} %}
             {% wire id=["message-subscriber", subscriber.user, forloop.counter]|join:"-"
                action={dialog_open template="_subscriber_message_form.tpl" title="Send Message" pid=subscriber.pid} %}
        </div>
        {% endfor %}

