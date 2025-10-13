from django.contrib import admin
from django.urls import path, include

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('study.urls')),
]

urlpatterns = [
    path('admin/', admin.site.urls),
    path('accounts/', include('accounts.urls')), 
    path('', include('study.urls')),  
]

urlpatterns = [
    path('admin/', admin.site.urls),
    path('study/', include('study.urls')),  
    path('accounts/', include('accounts.urls')),  
]