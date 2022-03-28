from django.contrib import admin
from store.models import Category, Product, UserProfile, Cart, Review, Order

# Register your models here.

class CategoryAdmin(admin.ModelAdmin):
    prepopulated_fields = {'slug':('name',)}

class ProductAdmin(admin.ModelAdmin):
    prepopulated_fields = {'slug':('name',)}

admin.site.register(Category)
admin.site.register(Product)
admin.site.register(UserProfile)
admin.site.register(Cart)
admin.site.register(Review)
admin.site.register(Order)