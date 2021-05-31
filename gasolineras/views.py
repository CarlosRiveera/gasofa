from django.shortcuts import render, redirect
from .forms import gasolineraForm, precioForm, usuarioForm
from .models import Gasolineras, Precios, Usuarios, Zona, Tipo_Gasolina
from django.db import connection


def home(request):
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
