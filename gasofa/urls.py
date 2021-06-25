from django.conf.urls import url
from django.contrib import admin
from django.contrib.auth.views import LoginView
from django.urls import path, include
from django.contrib.auth import login,logout

urlpatterns = [
    path('admin/', admin.site.urls),
    path('gasolineras/', include('gasolineras.urls')),
    path('', LoginView.as_view(template_name='home.html')),
]
