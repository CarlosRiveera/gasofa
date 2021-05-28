from django import forms
from .models import Gasolineras, Precios

class gasolineraForm(forms.ModelForm):
    class Meta:
        model = Gasolineras
        fields = '__all__'
        labels = {
            'nombre': 'Nombre:',
            'direccion': 'Direccion:',
            'municipio': 'Municipio:',
        }
        widgets = {
          'nombre': forms.TextInput(attrs={'class': 'form-control'}),
          'direccion': forms.TextInput(attrs={'class': 'form-control'}),
          'municipio': forms.Select(attrs={'class': 'form-control'}),
        }

class precioForm(forms.ModelForm):
    class Meta:
        model = Precios
        fields = '__all__'
        labels = {
            'precio': 'Precio:',
            'fecha_creacion': 'Fecha creacion:',
            'tipo_precio': 'Tipo precio:',
            'usuario': 'Usuario:',
            
        }
        widgets = {
          'precio': forms.TextInput(attrs={'class': 'form-control'}),
          'tipo_precio': forms.Select(attrs={'class': 'form-control'}),
          'usuario': forms.TextInput(attrs={'class': 'form-control'}),
        }



