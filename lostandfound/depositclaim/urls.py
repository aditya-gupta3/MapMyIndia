from django.conf.urls import patterns, url

from depositclaim import views

urlpatterns = patterns('',
    url(r'^$', views.index, name='index'),
    url(r'deposit', views.deposit, name='deposit'),
    url(r'claim', views.claim, name='claim'),

)