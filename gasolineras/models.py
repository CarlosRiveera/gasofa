from django.db import models

from db_file_storage.model_utils import delete_file, delete_file_if_needed
from db_file_storage.compat import  reverse
from django.core.validators import MaxValueValidator
from django.db import models
from django.conf import settings
import random
import string

# Create your models here.

class Zona(models.Model):
    id = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=50)
    def __str__(self):
            return '{}'.format(self.nombre)

class Departamento(models.Model):
    id = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=50)
    zona = models.ForeignKey(Zona, on_delete=models.CASCADE)
    def __str__(self):
        return self.nombre
    class Meta:
        ordering = ['nombre']

class Municipio(models.Model):
    id = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=50)
    departamento = models.ForeignKey(Departamento, on_delete=models.CASCADE)
    def __str__(self):
        return self.nombre
    class Meta:
        ordering = ['nombre']

class Gasolineras(models.Model):
    id = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=50)
    direccion = models.CharField(max_length=250)
    municipio = models.ForeignKey(Municipio, on_delete=models.CASCADE)
    def __str__(self):
        return self.nombre
    class Meta:
        ordering = ['nombre']

class Tipo_Precio(models.Model):
    id = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=50)
    def __str__(self):
        return self.nombre
    class Meta:
        ordering = ['nombre']

class Tipo_Usuario(models.Model):
    id = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=50)
    def __str__(self):
        return self.nombre
    class Meta:
        ordering = ['nombre']

class Usuarios(models.Model):
    id = models.AutoField(primary_key=True)
    usuario = models.CharField(max_length=50)
    clave = models.CharField(max_length=50)
    tipo_usuario = models.ForeignKey(Tipo_Usuario, on_delete=models.CASCADE)
    def __str__(self):
        return self.usuario
    class Meta:
        ordering = ['usuario']

class Tipo_Gasolina(models.Model):
    id = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=50)
    def __str__(self):
        return self.nombre
    class Meta:
        ordering = ['nombre']

class Precios(models.Model):
    id = models.AutoField(primary_key=True)
    precio = models.DecimalField(max_digits=6, decimal_places=2)
    fecha_creacion = models.DateField(auto_now_add=False)
    tipo_gasolina = models.ForeignKey(Tipo_Gasolina, on_delete=models.CASCADE)
    tipo_precio = models.ForeignKey(Tipo_Precio, on_delete=models.CASCADE)
    usuario = models.ForeignKey(Usuarios, on_delete=models.CASCADE)
    def __str__(self):
        return self.precio
    class Meta:
        ordering = ['precio']

class Precios_Gasolineras(models.Model):
    id = models.AutoField(primary_key=True)
    precio = models.ForeignKey(Precios, on_delete=models.CASCADE)
    gasolinera =  models.ForeignKey(Gasolineras, on_delete=models.CASCADE)
    usuario = models.ForeignKey(Usuarios, on_delete=models.CASCADE)
    def __str__(self):
        return self.precio
    class Meta:
        ordering = ['precio']

class Precios_Zonas(models.Model):
    id = models.AutoField(primary_key=True)
    precio = models.ForeignKey(Precios, on_delete=models.CASCADE)
    zona =  models.ForeignKey(Zona, on_delete=models.CASCADE)
    def __str__(self):
        return self.precio
    class Meta:
        ordering = ['precio']










    