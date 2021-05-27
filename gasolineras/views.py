from django.shortcuts import render
from .forms import zonaForm
from .models import Zona

# Create your views here.
def zona_list(request):
    context = {'zona_list': Zona.objects.all()}
    return render(request, "zonas_list.html", context)

def zonas_form(request, id=0):
    if request.method == "GET": 
        if id == 0:
            form = zonaForm()
        else:
            Entidad = Zona.objects.get(pk=id)
            form = zonaForm(instance=Entidad)
        return render(request, "zonas_form.html", {'form': form})
    else:
        if id == 0:
            form = zonaForm(request.POST)
        else:
            Entidad = Zona.objects.get(pk=id)
            form = zonaForm(request.POST,instance= Entidad)
        if form.is_valid():
            form.save()
        return redirect('/list')
    
def zona_delete(request, id):
    Entidad = Zona.objects.get(pk=id)
    Entidad.delete()
    return redirect('/list') 