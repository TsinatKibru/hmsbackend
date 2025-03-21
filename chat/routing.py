from channels.routing import ProtocolTypeRouter, URLRouter
# import app.routing
from django.urls import re_path
from app.consumers import NotificationConsumer, ItemTransferConsumer, OrderConsumer
websocket_urlpatterns = [


    re_path(r'^ws/item_transfer/$', ItemTransferConsumer.as_asgi()),
    re_path(r'^ws/order_exchange/$', OrderConsumer.as_asgi()),
    re_path(r'^ws/notifications/$', NotificationConsumer.as_asgi()),

]
# the websocket will open at 127.0.0.1:8000/ws/<room_name>
application = ProtocolTypeRouter({
    'websocket':
        URLRouter(
            websocket_urlpatterns
        ),
})
