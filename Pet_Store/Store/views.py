from django.shortcuts import render
from django.http import HttpResponse

def index(request):
    context_dict = {'boldmessage': 'Pet R US'}
    return render(request, 'Store/index.html', context=context_dict)

def about(request):
    return render(request, 'Store/about.html')