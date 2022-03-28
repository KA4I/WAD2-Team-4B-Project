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
    path('review/<slug:product_name_slug>/', views.write_review, name='write_review'),
    path('register_profile/', views.register_profile, name='register_profile'),
    path('logout/', views.logout_view, name='logout'),
    path('profile/<username>/', views.ProfileView.as_view(), name='profile'),
    path('like_product/', views.LikeProductView.as_view(), name='like_product'),
    path('add_cart/', views.AddCartView.as_view(), name='add_cart'),
    path('remove_cart/', views.RemoveCartView.as_view(), name='remove_cart'),
    path('update_cart/', views.UpdateCartView.as_view(), name='update_cart'),
    path('cart/<username>/', views.CartView.as_view(), name='cart'),
    path('order_cart/', views.OrderCartView.as_view(), name='order_cart'),
    path('search/', views.search, name='search'),
    
]
