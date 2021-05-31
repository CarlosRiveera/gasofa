from django.urls import path
from django.conf.urls import url, include
from .views import *
from . import views


urlpatterns = [
  path('', views.home, name = "Home"),
  path('precios_gasolineras', views.gasoline_prices, name = "gasoline_prices"),
  #urls for gas
  path('gasolinera', views.gasolinera_form, name="gasolinera_insert"),
  path('list/', views.gasolinera_list, name="gasolinera_list"),
  path('<int:id>/', views.gasolinera_form,name='gasolinera_update'),
  path('delete/<int:id>/',views.gasolinera_delete,name='gasolinera_delete'),
  #urls for prices
  path('precios', views.precio_form, name="precio_insert"),
  path('precio_list/', views.precio_list, name="precio_list"),
  path('precio_update/<int:id>/', views.precio_form,name='precio_update'),
  path('precio_delete/<int:id>/',views.precio_delete,name='precio_delete'),
  #urls for users
  path('usuarios', views.usuario_form, name="usuario_insert"),
  path('usuario_list/', views.usuario_list, name="usuario_list"),
  path('usuario_update/<int:id>/', views.usuario_form,name='usuario_update'),
  path('usuario_delete/<int:id>/',views.usuario_delete,name='usuario_delete'),
]