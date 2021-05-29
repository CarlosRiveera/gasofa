from django import forms
from .models import Gasolineras, Precios, Usuarios

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
          'usuario': forms.Select(attrs={'class': 'form-control'}),
          'fecha_creacion': forms.TextInput(attrs={'class': 'form-control', 'type': 'date'}),
        }

class usuarioForm(forms.ModelForm):
    class Meta:
        model = Usuarios
        fields = '__all__'
        labels = {
            'usuario': 'Usuario:',
            'clave': 'Clave:',
            'tipo_usuario': 'Tipo Usuario:',
            
        }
        widgets = {
          'usuario': forms.TextInput(attrs={'class': 'form-control'}),
          'tipo_usuario': forms.Select(attrs={'class': 'form-control'}),
          'clave': forms.PasswordInput(attrs={'class': 'form-control'}),
        }

