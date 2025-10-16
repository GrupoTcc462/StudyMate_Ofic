from django import forms
from .models import Note

class NoteForm(forms.ModelForm):
    class Meta:
        model = Note
        fields = ["title", "description", "content", "file", "is_professor"]
        widgets = {
            "title": forms.TextInput(attrs={"class":"form-control"}),
            "description": forms.Textarea(attrs={"class":"form-control","rows":2}),
            "content": forms.Textarea(attrs={"class":"form-control","id":"id_content"}),
            "file": forms.ClearableFileInput(attrs={"class":"form-control"}),
            "is_professor": forms.CheckboxInput(attrs={"class":"form-check-input"}),
        }
