<form id="subscriber_message_form" action="postback" method="POST">
<input id="message" name="message">
<button type="submit">Post</button>
{% wire id="subscriber_message_form" type="submit" 
                                                   action={dialog_close}
                                                   postback={subscriber_message pid=pid} 
                                                   delegate="mod_overlord" %}

