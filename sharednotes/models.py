from django.db import models
from django.db import models
from django.contrib.auth import get_user_model
import os

User = get_user_model()

def note_file_path(instance, filename):
    uid = instance.author.id if instance.author else "anon"
    return os.path.join("notes_files", str(uid), filename)

class Note(models.Model):
    title = models.CharField(max_length=200)
    description = models.TextField(blank=True)
    content = models.TextField(blank=True, null=True)
    file = models.FileField(upload_to=note_file_path, blank=True, null=True)
    is_professor = models.BooleanField(default=False)
    author = models.ForeignKey(User, on_delete=models.SET_NULL, null=True, blank=True)
    created_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        ordering = ["-created_at"]

    def __str__(self):
        return self.title
