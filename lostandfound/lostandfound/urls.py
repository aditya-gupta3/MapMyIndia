from django.conf.urls import patterns, include, url
from django.contrib import admin
from depositclaim import views
urlpatterns = patterns('',
    # Examples:
    # url(r'^$', 'lostandfound.views.home', name='home'),
    # url(r'^blog/', include('blog.urls')),

    url(r'^admin/', include(admin.site.urls)),
    url(r'^depositclaim/', include('depositclaim.urls', namespace="depositclaim")),

)
