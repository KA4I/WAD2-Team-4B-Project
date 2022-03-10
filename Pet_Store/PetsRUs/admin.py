from django.contrib import admin
from rango.models import UserProfile

# Register your models here.
from django.contrib import admin
from rango.models import Category, Page


class CategoryAdmin(admin.ModelAdmin):
    prepopulated_fields = {'slug':('name',)}

class PageAdmin(admin.ModelAdmin):
     list_display = ('title', 'category', 'url')
     

admin.site.register(Page, PageAdmin)
# Update the registration to include this customised interface
admin.site.register(Category, CategoryAdmin)
admin.site.register(UserProfile)