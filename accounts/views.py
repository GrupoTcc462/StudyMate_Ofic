from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login
from django.contrib import messages

def login_view(request):
    if request.method == 'POST':
        username = request.POST['username']
        password = request.POST['password']
        
        user = authenticate(request, username=username, password=password)
        if user is not None:
            login(request, user)
            return redirect('home')  # Redireciona após login
        else:
            messages.error(request, 'Usuário ou senha inválidos.')
    return render(request, 'accounts/login.html')
 
def logout_view(request):
    logout(request)
    return redirect('login')
 
def index(request):
    return render(request, 'accounts/login.html')
