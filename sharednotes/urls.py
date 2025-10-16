from django.urls import path
from . import views

app_name = "sharednotes"

urlpatterns = [
    path("", views.notes_list, name="list"),
]
