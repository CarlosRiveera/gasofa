from django.urls import path
from django.conf.urls import url, include
from .views import *
from . import views


urlpatterns = [
  #listas
	path('', views.zonas_form, name="zona_insert"),
]