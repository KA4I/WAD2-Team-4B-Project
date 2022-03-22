from django.urls import path
from store import views

app_name = 'store'

urlpatterns = [
    path('', views.home, name='home'),
    path('home/', views.home, name='home'),
    path('about/', views.about, name='about'),
    path('contact/', views.contact, name='contact'),
    path('category/<slug:category_name_slug>/', views.show_category, name='show_category'),
    path('product/<slug:product_name_slug>/', views.show_product, name='show_product'),
    path('register_profile/', views.register_profile, name='register_profile'),
    path('profile/<username>/', views.ProfileView.as_view(), name='profile'),
    path('like_product/', views.LikeProductView.as_view(), name='like_product'),
    path('order_product/', views.OrderProductView.as_view(), name='order_product'),
]