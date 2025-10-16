from django.shortcuts import render

from django.shortcuts import render, redirect
from django.core.paginator import Paginator
from .models import Note
from .forms import NoteForm

def notes_list(request):
    tab = request.GET.get("tab", "professores")

    if request.method == "POST":
        form = NoteForm(request.POST, request.FILES)
        if form.is_valid():
            note = form.save(commit=False)
            if request.user.is_authenticated:
                note.author = request.user
            note.save()
            return redirect("sharednotes:list")
    else:
        form = NoteForm()

    if tab == "professores":
        qs = Note.objects.filter(is_professor=True)
    else:
        qs = Note.objects.filter(is_professor=False)

    paginator = Paginator(qs, 6)  # 6 por página
    page_number = request.GET.get("page")
    page_obj = paginator.get_page(page_number)

    return render(request, "sharednotes/notes_list.html", {
        "notes": page_obj,
        "form": form,
        "tab": tab,
    })
