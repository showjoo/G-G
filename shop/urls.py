from django.conf.urls import url
from shop.views import *

urlpatterns = [
    url(r'^$', index, name='index'),
    url(r'^productList/$', plist, name='plist'),
    url(r'^check/$', check, name='check'),
    url(r'^order/$', order, name='order'),
    url(r'^products/$', products, name='products'),
    url(r'^removeProduct/$', removeProduct, name='removeProduct'),
    url(r'^logout$', do_logout, name='logout'),
    url(r'^reg', do_reg, name='reg'),
    url(r'^loggin',do_login, name='loggin'),
    url(r'^productLook/$', plook, name='plook'),
    url(r'^addProductCar/$', addtocar, name='addtocar'),
    url(r'^shopcar/$', shopcar, name='shopcar'),
    url(r'^search/$', search, name='search'),
    url(r'^usercenter/$', usercenter, name='usercenter'),
    url(r'^saveOrder$', saveOrder, name='saveOrder'),
    url(r'^history_order$', history_order, name='history_order'),
    url(r'^history_donation$', history_donation, name='history_donation'),
]
