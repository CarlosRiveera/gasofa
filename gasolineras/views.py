from re import template
from django.http.response import HttpResponse, HttpResponseRedirect
from django.shortcuts import render, redirect
from .forms import *
from .models import Gasolineras, Precios, Usuarios, Zona, Tipo_Gasolina, Departamento, Municipio
from django.db import connection
import pdb
from django.contrib.auth import authenticate, login, logout
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import User

def home(request):
    if request.user.is_authenticated:
        gid = request.GET.get('gid', None)      # Gasolina
        if gid is None or gid == '':
            gid = -1
        zid = request.GET.get('zid', None)      # Zona
        if zid is None or zid == '':
            zid = -1
        dfrom = request.GET.get('dfrom', None)  # Fecha: Desde
        if dfrom is None or dfrom == '':
            dfrom = -1
        dto = request.GET.get('dto', None)      # Fecha: Hasta
        if dto is None or dto == '':
            dto = -1

        finalQuery = "SELECT pz.id AS id, p.precio AS precio, tp.nombre AS tipo_precio, z.nombre as zona, tg.nombre as gasolina, p.fecha_creacion as fecha "
        finalQuery += "FROM gasolineras_precios_zonas AS pz, gasolineras_precios AS p, gasolineras_tipo_precio AS tp, gasolineras_zona AS z, gasolineras_tipo_gasolina as tg "
        finalQuery += "WHERE pz.precio_id = p.id AND pz.zona_id = z.id AND p.tipo_precio_id = tp.id AND p.tipo_gasolina_id = tg.id"

        if gid != -1 and gid != "-1":
            finalQuery += " AND tg.id = " + gid
        if zid != -1 and zid != "-1":
            finalQuery += " AND z.id = " + zid
        if dfrom != -1:
            finalQuery += " AND p.fecha_creacion >= '" + dfrom + "'"
        if dto != -1:
            finalQuery += " AND p.fecha_creacion <= '" + dto + "'"
        finalQuery += " ORDER BY p.fecha_creacion ASC;"

        with connection.cursor() as cursor:
            cursor.execute(finalQuery)
            queryResponse = cursor.fetchall()

        context = {
            'gasolinas': Tipo_Gasolina.objects.all().order_by('id'),
            'zonas': Zona.objects.all().order_by('id'),
            'queryResponse': queryResponse, 
            'gid': int(gid),
            'zid': int(zid),
            'finalQuery': finalQuery
        }

        if dfrom != -1:
            context['dfrom'] = dfrom
        
        if dto != -1:
            context['dto'] = dto

        centralEspecial = []
        centralRegular = []
        centralDiesel = []
        orientalEspecial = []
        orientalRegular = []
        orientalDiesel = []
        occidentalEspecial = []
        occidentalRegular = []
        occidentalDiesel = []

        for item in queryResponse:
            if item[3] == 'Central':
                if item[4] == 'Especial':
                    centralEspecial.append(item)
                if item[4] == 'Regular':
                    centralRegular.append(item)
                if item[4] == 'Diesel':
                    centralDiesel.append(item)
            if item[3] == 'Oriental':
                if item[4] == 'Especial':
                    orientalEspecial.append(item)
                if item[4] == 'Regular':
                    orientalRegular.append(item)
                if item[4] == 'Diesel':
                    orientalDiesel.append(item)
            if item[3] == 'Occidental':
                if item[4] == 'Especial':
                    occidentalEspecial.append(item)
                if item[4] == 'Regular':
                    occidentalRegular.append(item)
                if item[4] == 'Diesel':
                    occidentalDiesel.append(item)

        context['centralEspecial'] = centralEspecial
        context['centralRegular'] = centralRegular
        context['centralDiesel'] = centralDiesel
        context['orientalEspecial'] = orientalEspecial
        context['orientalRegular'] = orientalRegular
        context['orientalDiesel'] = orientalDiesel
        context['occidentalEspecial'] = occidentalEspecial
        context['occidentalRegular'] = occidentalRegular
        context['occidentalDiesel'] = occidentalDiesel

        return render(request, "home.html", context)
    else:
        return redirect('login')
    

def gasoline_prices(request):
    if request.user.is_authenticated:
        gaid = request.GET.get('gaid', None)    # Gasolinera
        if gaid is None or gaid == '':
            gaid = -1
        gid = request.GET.get('gid', None)      # Gasolina
        if gid is None or gid == '':
            gid = -1
        zid = request.GET.get('zid', None)      # Zona
        if zid is None or zid == '':
            zid = -1
        did = request.GET.get('did', None)      # Departamento
        if did is None or did == '':
            did = -1
        mid = request.GET.get('mid', None)      # Municipio
        if mid is None or mid == '':
            mid = -1
        dfrom = request.GET.get('dfrom', None)  # Fecha: Desde
        if dfrom is None or dfrom == '':
            dfrom = -1
        dto = request.GET.get('dto', None)      # Fecha: Hasta
        if dto is None or dto == '':
            dto = -1

        finalQuery = "SELECT pg.id AS id, g.nombre AS gasolinera, p.precio AS precio, tp.nombre AS tipo_precio, tg.nombre as gasolina, p.fecha_creacion as fecha,"
        finalQuery += " d.nombre as departamento, m.nombre as municipio, z.nombre as zona "
        finalQuery += "FROM gasolineras_precios_gasolineras AS pg, gasolineras_gasolineras as g, gasolineras_precios AS p, gasolineras_tipo_precio AS tp, gasolineras_tipo_gasolina as tg,"
        finalQuery += " gasolineras_zona as z, gasolineras_departamento as d, gasolineras_municipio as m "
        finalQuery += "WHERE pg.precio_id = p.id AND p.tipo_precio_id = tp.id AND pg.gasolinera_id = g.id AND p.tipo_gasolina_id = tg.id"
        finalQuery += " AND g.municipio_id = m.id AND m.departamento_id = d.id AND d.zona_id = z.id"

        if gaid != -1 and gaid != "-1":
            finalQuery += " AND g.id = " + gaid
        if gid != -1 and gid != "-1":
            finalQuery += " AND tg.id = " + gid
        if zid != -1 and zid != "-1":
            finalQuery += " AND z.id = " + zid
        if did != -1 and did != "-1":
            finalQuery += " AND d.id = " + did
        if mid != -1 and mid != "-1":
            finalQuery += " AND m.id = " + mid
        if dfrom != -1:
            finalQuery += " AND p.fecha_creacion >= '" + dfrom + "'"
        if dto != -1:
            finalQuery += " AND p.fecha_creacion <= '" + dto + "'"
        finalQuery += " ORDER BY p.fecha_creacion ASC;"

        with connection.cursor() as cursor:
            cursor.execute(finalQuery)
            queryResponse = cursor.fetchall()

        context = {
            'gasolineras': Gasolineras.objects.all().order_by('id'),
            'gasolinas': Tipo_Gasolina.objects.all().order_by('id'),
            'zonas': Zona.objects.all().order_by('id'),
            'departamentos': Departamento.objects.all().order_by('nombre'),
            'municipios': Municipio.objects.all().order_by('nombre'),
            'queryResponse': queryResponse, 
            'gaid': int(gaid),
            'gid': int(gid),
            'zid': int(zid),
            'mid': int(mid),
            'did': int(did),
            'finalQuery': finalQuery
        }

        if dfrom != -1:
            context['dfrom'] = dfrom
        
        if dto != -1:
            context['dto'] = dto

        return render(request, "gasoline_prices.html", context)
    else:
        return redirect('login')
    

# this is for gasolineras.
def gasolinera_list(request):
    if request.user.is_authenticated:
        context = {'gasolinera_list': Gasolineras.objects.all()}
        return render(request, "gasolineras_list.html", context)
    else:
        return redirect('login')

def gasolinera_form(request, id=0):
    if request.user.is_authenticated:
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
            
    else:
        return redirect('login')
    
def gasolinera_delete(request, id):
    if request.user.is_authenticated:
        Gasolinera = Gasolineras.objects.get(pk=id)
        Gasolinera.delete()
        return redirect('/gasolineras/list') 
            
    else:
        return redirect('login')


# this is for precios.
def precio_list(request):
    if request.user.is_authenticated:
        context = {'precio_list': Precios.objects.all()}
        return render(request, "precios_list.html", context)
        
    else:
        return redirect('login')

def precio_form(request, id=0):
    if request.user.is_authenticated:
        if request.method == "GET": 
            if id == 0:
                form = precioForm()
                form2 = precioZona()
            else:
                Precio = Precios.objects.get(pk=id)
                form = precioForm(instance=Precio)
                form2 = precioZona()
            return render(request, "precios_form.html", {'form': form, 'form2': form2})
        else:
            if id == 0:
                form = precioForm(request.POST)
            else:
                Precio = Precios.objects.get(pk=id)
                form = precioForm(request.POST,instance= Precio)
            if form.is_valid():
                form2 = precioZona()
                # gets the value of the zone selected 
                selected_value = request.POST['zona']
                task = form.save()
                # gets the value of the id that was created
                pk = task.id
                # creates the object containing the prices by zone 
                obj = Precios_Zonas()
                obj.precio = Precios.objects.get(id = pk)
                obj.zona = Zona.objects.get(id = selected_value) 
                obj.save()
                #html = "<html><body>It is now %s and %s </body></html>" % (selected_value, pk)
                #return HttpResponse(html)
            return redirect('/gasolineras/precio_list')
    else:
        return redirect('login')

def precio_delete(request, id):
    if request.user.is_authenticated:
        Precio = Precios.objects.get(pk=id)
        Precio.delete()
        obj = Precios_Zonas.objects.get(pk=id)
        obj.delete()
        return redirect('/gasolineras/precio_list') 
    else:
        return redirect('login')



def precioG_list(request):
    if request.user.is_authenticated:
        context = {'precioG_list': Precios.objects.all()}
        return render(request, "preciosG_list.html", context)
    else:
        return redirect('login')

def precioG_form(request, id=0):
    if request.user.is_authenticated:
        if request.method == "GET": 
            if id == 0:
                form = precioForm()
                form2 = precioGasolinera()
            else:
                Precio = Precios.objects.get(pk=id)
                form = precioForm(instance=Precio)
                form2 = precioGasolinera()
            return render(request, "preciosG_form.html", {'form': form, 'form2': form2})
        else:
            if id == 0:
                form = precioForm(request.POST)
            else:
                Precio = Precios.objects.get(pk=id)
                form = precioForm(request.POST,instance= Precio)
            if form.is_valid():
                form2 = precioGasolinera()
                # gets the value of the zone selected 
                selected_value = request.POST['gasolinera']
                selectedU_value = request.POST['usuario']
                task = form.save()
                # gets the value of the id that was created
                pk = task.id
                # creates the object containing the prices by zone 
                obj = Precios_Gasolineras()
                obj.precio = Precios.objects.get(id = pk)
                obj.gasolinera = Gasolineras.objects.get(id = selected_value) 
                obj.usuario = Usuarios.objects.get(id = selectedU_value) 
                obj.save()
                #html = "<html><body>It is now %s and %s </body></html>" % (selected_value, pk)
                #return HttpResponse(html)
            return redirect('/gasolineras/precio_list')
    else:
        return redirect('login')

def precio_delete(request, id):
    if request.user.is_authenticated:
        Precio = Precios.objects.get(pk=id)
        Precio.delete()
        obj = Precios_Gasolineras.objects.get(pk=id)
        obj.delete()
        return redirect('/gasolineras/precio_list') 
    else:
        return redirect('login')


# this is for usuarios.
def usuario_list(request):
    if request.user.is_authenticated:
        context = {'usuario_list': Usuarios.objects.all()}
        return render(request, "usuarios_list.html", context)
    else:
        return redirect('login')

def usuario_form(request, id=0):
    if request.user.is_authenticated:
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
    else:
        return redirect('login')
    
def usuario_delete(request, id):
    if request.user.is_authenticated:
        Usuario = Usuarios.objects.get(pk=id)
        Usuario.delete()
        return redirect('/gasolineras/usuario_list') 
    else:
        return redirect('login')

def registerPage(request):
	
		form = CreateUserForm()
		form2 = usuarioForm()
		if request.method == 'POST':
			form = CreateUserForm(request.POST)
			if form.is_valid():
				form2 = usuarioForm()
				selected_value = request.POST['tipo_usuario']
				form.save()
				obj = Usuarios()
				obj.usuario = request.POST['username']
				obj.clave = request.POST['password1']
				obj.tipo_usuario = Tipo_Usuario.objects.get(id = selected_value) 
				obj.save()
				user = form.cleaned_data.get('username')
				messages.success(request, 'Account was created for ' + user)
				return redirect('login')
		context = {'form':form, 'form2': form2}
		return render(request, 'usuarios_form.html', context)

def loginPage(request):
	if request.user.is_authenticated:
		return redirect('Home')
	else:
		if request.method == 'POST':
			username = request.POST.get('username')
			password = request.POST.get('password')

			user = authenticate(request, username=username, password=password)

			if user is not None:
				login(request, user)
				return redirect('gasoline_prices')
			else:
				messages.info(request, 'usuario OR clave son incorrectas')

		context = {}
		return render(request, 'login.html', context)

def logoutUser(request):
	logout(request)
	return redirect('login')