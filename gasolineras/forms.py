from django import forms
from .models import Zona

class zonaForm(forms.ModelForm):
    class Meta:
        model = Zona
        fields = '__all__'
        labels = {
            'nombre': 'Nombre:'
        }
        widgets = {
          'nombre': forms.TextInput(attrs={'class': 'form-control'}),
        }


