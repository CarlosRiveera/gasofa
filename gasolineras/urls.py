from django.urls import path
from django.conf.urls import url, include
from .views import *
from . import views


urlpatterns = [
  #listas
	path('', views.precio_form, name="precio_insert"),
  path('list/', views.gasolinera_list, name="gasolinera_list"),
  path('<int:id>/', views.gasolinera_form,name='gasolinera_update'),
  path('delete/<int:id>/',views.gasolinera_delete,name='gasolinera_delete'),
]