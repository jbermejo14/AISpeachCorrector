from django.urls import path
from . import views

urlpatterns = [
    path('', views.index, name='index'),

    path('upload_success', views.upload_success, name='upload_success'),
    path('upload', views.upload, name='upload'),
    path('view_upload', views.view_upload, name='view_upload'),
    path('register', views.register, name='register'),
    path('login', views.login_view, name='login_view'),
    path('logout', views.logout_view, name='logout_view')
]