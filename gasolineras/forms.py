from django import forms
from .models import *
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User

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
            'id': 'id precio:',
            'precio': 'Precio:',
            'tipo_precio': 'Tipo precio:',
            'usuario': 'Usuario:',
            'tipo_gasolina': 'Tipo Gasolina:',
            'zona': 'Zona:',
            'gasolinera': 'Nombre gasolinera:'
        }
        widgets = {
          'id': forms.TextInput(attrs={'class': 'form-control'}),
          'precio': forms.TextInput(attrs={'class': 'form-control'}),
          'tipo_precio': forms.Select(attrs={'class': 'form-control'}),
          'usuario': forms.Select(attrs={'class': 'form-control'}),
          'tipo_gasolina': forms.Select(attrs={'class': 'form-control','id': 'tipoGass'}),
          'zona': forms.Select(attrs={'id': 'zoneSelected'}, choices=Zona.objects.all()),
          'gasolinera': forms.Select(attrs={'id': 'gasolineraSelect'}, choices=Gasolineras.objects.all())
        }
        

class precioZona(forms.ModelForm):
    class Meta:
        model = Precios_Zonas
        fields = '__all__'
        labels = {
            'precio': 'Precio:',
            'zona': 'Zona:',
        }
        widgets = {
          'precio': forms.Select(attrs={'class': 'form-control'}),
          'zona': forms.Select(attrs={'class': 'form-control'})
        }

class precioGasolinera(forms.ModelForm):
    class Meta:
        model = Precios_Gasolineras
        fields = '__all__'
        labels = {
            'precio': 'Precio:',
            'gasolinera': 'Gasolinera:',
            'usuario': 'Usuario:',
        }
        widgets = {
          'precio': forms.Select(attrs={'class': 'form-control'}),
          'gasolinera': forms.Select(attrs={'class': 'form-control'}),
          'usuario': forms.Select(attrs={'class': 'form-control'})
        }


class usuarioForm(UserCreationForm):
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
          'clave': forms.PasswordInput(attrs={'class': 'form-control'})
        }

class CreateUserForm(UserCreationForm):
    class Meta:
        model = User
        fields = ['username', 'email', 'password1', 'password2']
        labels = {
            'username': 'Usuario:',
            'email': 'Email:',
            'password1': 'Contraseña:',
            'password2': 'Contraseña:',
            'tipo_usuario': 'Tipo Usuario:'
        }
        widgets = {
          'username': forms.TextInput(attrs={'class': 'form-control'}),
          'password1': forms.PasswordInput(attrs={'class': 'form-control'}),
          'password2': forms.PasswordInput(attrs={'class': 'form-control'}),
          'email': forms.TextInput(attrs={'class': 'form-control'}),
          'tipo_usuario': forms.Select(attrs={'id': 'zoneSelected'}, choices=Tipo_Usuario.objects.all()),
        }
