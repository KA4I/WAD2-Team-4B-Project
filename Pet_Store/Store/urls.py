from django.shortcuts import render
from django.http import HttpResponse
from django.shortcuts import redirect
from django.urls import reverse
from django.urls import path
from Store import views

app_name = 'Store'

urlpatterns = [
    path('', views.index, name='index'),
    path('about/', views.about, name='about'),
]