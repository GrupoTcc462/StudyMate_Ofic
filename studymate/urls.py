from django.contrib import admin
from django.contrib import admin
from django.urls import path, include
from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    path('admin/', admin.site.urls),
    path('accounts/', include('accounts.urls')), 
    path('', include('study.urls')),  # Rota vazia redireciona para study
    path('notes/', include('sharednotes.urls')),  # nossa rota de notes
path('notes/', include('sharednotes.urls')),  # nossa rota de notes
]

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)