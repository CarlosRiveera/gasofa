from django.shortcuts import render, redirect
from .forms import gasolineraForm, precioForm, usuarioForm
from .models import Gasolineras, Precios, Usuarios


def home(request):
    context = {}
    return render(request, "index.html", context)


# this is for gasolineras.
def gasolinera_list(request):
    context = {'gasolinera_list': Gasolineras.objects.all()}
    return render(request, "gasolineras_list.html", context)

def gasolinera_form(request, id=0):
    if request.method == "GET": 
        if id == 0:
            form = gasolineraForm()
        else:
            Gasolinera = Gasolineras.objects.get(pk=id)
            form = gasolineraForm(instance=Gasolinera)
        return render(request, "gasolineras_form.html", {'form': form})
    else:
        if id == 0:
            form = gasolineraForm(request.POST)
        else:
            Gasolinera = Gasolineras.objects.get(pk=id)
            form = gasolineraForm(request.POST,instance= Gasolinera)
        if form.is_valid():
            form.save()
        return redirect('/gasolineras/list')
    
def gasolinera_delete(request, id):
    Gasolinera = Gasolineras.objects.get(pk=id)
    Gasolinera.delete()
    return redirect('/gasolineras/list') 


# this is for precios.
def precio_list(request):
    context = {'precio_list': Precios.objects.all()}
    return render(request, "precios_list.html", context)

def precio_form(request, id=0):
    if request.method == "GET": 
        if id == 0:
            form = precioForm()
        else:
            Precio = Precios.objects.get(pk=id)
            form = precioForm(instance=Precio)
        return render(request, "precios_form.html", {'form': form})
    else:
        if id == 0:
            form = precioForm(request.POST)
        else:
            Precio = Precios.objects.get(pk=id)
            form = precioForm(request.POST,instance= Precio)
        if form.is_valid():
            form.save()
        return redirect('/gasolineras/precio_list')
    
def precio_delete(request, id):
    Precio = Precios.objects.get(pk=id)
    Precio.delete()
    return redirect('/gasolineras/precio_list') 

# this is for usuarios.
def usuario_list(request):
    context = {'usuario_list': Usuarios.objects.all()}
    return render(request, "usuarios_list.html", context)

def usuario_form(request, id=0):
    if request.method == "GET": 
        if id == 0:
            form = usuarioForm()
        else:
            Usuario = Usuarios.objects.get(pk=id)
            form = usuarioForm(instance=Usuario)
        return render(request, "usuarios_form.html", {'form': form})
    else:
        if id == 0:
            form = usuarioForm(request.POST)
        else:
            Usuario = Usuarios.objects.get(pk=id)
            form = usuarioForm(request.POST,instance= Usuario)
        if form.is_valid():
            form.save()
        return redirect('/gasolineras/usuario_list')
    
def usuario_delete(request, id):
    Usuario = Usuarios.objects.get(pk=id)
    Usuario.delete()
    return redirect('/gasolineras/usuario_list') 
