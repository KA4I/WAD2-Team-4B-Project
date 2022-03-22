from datetime import datetime
from types import new_class
from django.shortcuts import render, redirect
from django.http import HttpResponse
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import User
from django.urls import reverse
from django.utils.decorators import method_decorator
from django.views import View
from store.models import Category, Product, UserProfile, Cart, Order
from store.forms import UserForm, UserProfileForm
import uuid


# Create your views here.

def home(request):
    category_list = Category.objects.all()
    product_list = Product.objects.order_by('-likes')[:5]

    context_dict = {}
    context_dict['boldmessage'] = 'Enjoy your visit!'
    context_dict['categories'] = category_list
    context_dict['products'] = product_list

    visitor_cookie_handler(request)
    context_dict['visits'] = request.session['visits']

    response = render(request, 'store/home.html', context=context_dict)
    return response

def about(request):
    context_dict = {'boldmessage': 'A Scottish pet store established in 2022!'}
    return render(request, 'store/about.html', context=context_dict)

def contact(request):
    context_dict = {'boldmessage': 'A Scottish pet store established in 2022!'}
    return render(request, 'store/contact.html', context=context_dict)

def show_category(request, category_name_slug):
    context_dict = {}
    try:
        category = Category.objects.get(slug=category_name_slug)
        products = Product.objects.filter(category=category)

        context_dict['products'] = products
        context_dict['category'] = category
    except Category.DoesNotExist:
        context_dict['products'] = None
        context_dict['category'] = None

    return render(request, 'store/category.html', context=context_dict)

def show_product(request, product_name_slug):
    context_dict = {}
    try:
        product = Product.objects.get(slug=product_name_slug)
        context_dict['product'] = product
    except Product.DoesNotExist:
        context_dict['product'] = None
        
    return render(request, 'store/product.html', context=context_dict)

@login_required
def register_profile(request):
    form = UserProfileForm()

    if request.method == 'POST':
        form = UserProfileForm(request.POST, request.FILES)

        if form.is_valid():
            user_profile = form.save(commit=False)
            user_profile.user = request.user
            user_profile.save()

            return redirect(reverse('store:home'))
        else:
            print(form.errors)

    context_dict = {'form': form}
    return render(request, 'store/profile_registration.html', context_dict)

def get_server_side_cookie(request, cookie, default_val=None):
    val = request.session.get(cookie)
    if not val:
        val = default_val
    return val

def visitor_cookie_handler(request):
    visits = int(get_server_side_cookie(request, 'visits', '1'))
    last_visit_cookie = get_server_side_cookie(request, 'last_visit', str(datetime.now()))
    last_visit_time = datetime.strptime(last_visit_cookie[:-7], '%Y-%m-%d %H:%M:%S')

    if (datetime.now() - last_visit_time).days > 0:
        visits = visits + 1
        request.session['last_visit'] = str(datetime.now())
    else:
        request.session['last_visit'] = last_visit_cookie
        request.session['visits'] = visits

class ProfileView(View):
    def get_user_details(self, username):
        try:
            user=User.objects.get(username=username)
        except User.DoesNotExist:
            return None

        user_profile = UserProfile.objects.get_or_create(user=user)[0]
        form = UserProfileForm({'address': user_profile.address,
                                'postcode': user_profile.postcode,
                                'picture': user_profile.picture})
        return (user, user_profile, form)

    @method_decorator(login_required)
    def get(self, request, username):
        try:
            (user, user_profile, form) = self.get_user_details(username)
            orders=Order.objects.filter(user=user)
        except TypeError:
            return redirect(reverse('store:home'))

        context_dict = {'user_profile': user_profile,
                        'selected_user': user,
                        'form': form,
                        'orders': orders}

        return render(request, 'store/profile.html', context_dict)

    @method_decorator(login_required)
    def post(self, request, username):
        try:
            (user, user_profile, form) = self.get_user_details(username)
            orders=Order.objects.filter(user=user)
        except TypeError:
            return redirect(reverse('store:home'))

        form = UserProfileForm(request.POST, request.FILES, instance=user_profile)
        if form.is_valid():
            form.save(commit=True)
            return redirect('store:profile', user.username)
        else:
            print(form.errors)

        context_dict = {'user_profile': user_profile,
                        'selected_user': user,
                        'form': form,
                        'orders': orders}

        return render(request, 'store/profile.html', context_dict)
      
class LikeProductView(View):
    @method_decorator(login_required)
    def get(self, request):
        product_id = request.GET['product_id']
        try:
            product = Product.objects.get(id=int(product_id))
        except Product.DoesNotExist:
            return HttpResponse(-1)
        except ValueError:
            return HttpResponse(-1)

        product.likes = product.likes + 1
        product.save()

        return HttpResponse(product.likes)

class AddCartView(View):
    @method_decorator(login_required)
    def get(self, request):
        product_id = request.GET['product_id']
        user_id = request.GET['user']
        try:
            product = Product.objects.get(id=int(product_id))
            user = User.objects.get(id=int(user_id))
        except Product.DoesNotExist:
            return HttpResponse(-1)
        except ValueError:
            return HttpResponse(-1)

        try:
            cart = Cart.objects.get_or_create(user=user, product=product)[0]
            cart.quantity += 1
            cart.save()
            print("Successfly created new cart item")
            return redirect(reverse('store:home'))
        except Exception as e:
            print(e)
            return HttpResponse(-1)

class RemoveCartView(View):
    @method_decorator(login_required)
    def get(self, request):
        product_id = request.GET['product_id']
        user_id = request.GET['user']
        try:
            product = Product.objects.get(id=int(product_id))
            user = User.objects.get(id=int(user_id))
        except Product.DoesNotExist:
            return HttpResponse(-1)
        except ValueError:
            return HttpResponse(-1)

        try:
            cart = Cart.objects.get_or_create(user=user, product=product)[0]
            cart.delete()
            return redirect(reverse('store:home'))
        except Exception as e:
            print(e)
            return HttpResponse(-1)

class CartView(View):
    def get_user_details(self, username):
        try:
            user=User.objects.get(username=username)
        except User.DoesNotExist:
            return None

        user_profile = UserProfile.objects.get_or_create(user=user)[0]
        form = UserProfileForm({'address': user_profile.address,
                                'postcode': user_profile.postcode,
                                'picture': user_profile.picture})
        return (user, user_profile, form)

    @method_decorator(login_required)
    def get(self, request, username):
        try:
            (user, user_profile, form) = self.get_user_details(username)
            cart_list = Cart.objects.filter(user=user)
            total_cost = 0
            for item in cart_list:
                total_cost += item.product.price
        except TypeError:
            return redirect(reverse('store:home'))

        context_dict = {'user_profile': user_profile,
                        'selected_user': user,
                        'form': form,
                        'cart': cart_list,
                        'total': total_cost}

        return render(request, 'store/cart.html', context_dict)

    @method_decorator(login_required)
    def post(self, request, username):
        try:
            (user, user_profile, form) = self.get_user_details(username)
            cart_list = Cart.objects.filter(user=user)
        except TypeError:
            return redirect(reverse('store:home'))

        form = UserProfileForm(request.POST, request.FILES, instance=user_profile)
        if form.is_valid():
            form.save(commit=True)
            return redirect('store:profile', user.username)
        else:
            print(form.errors)

        context_dict = {'user_profile': user_profile,
                        'selected_user': user,
                        'form': form,
                        'cart': cart_list}

        return render(request, 'store/cart.html', context_dict)

class OrderCartView(View):
    @method_decorator(login_required)
    def get(self, request):
        user_id = request.GET['user']
        try:
            user = User.objects.get(id=int(user_id))
        except Product.DoesNotExist:
            return HttpResponse(-1)
        except ValueError:
            return HttpResponse(-1)

        try:
            cart_list = Cart.objects.filter(user=user)
            for item in cart_list:
                order = Order.objects.get_or_create(uid=uuid.uuid4(), user=item.user, product=item.product)[0]
                order.quantity += item.quantity
                order.arrival_time = '2025-01-01 12:00:00'
                order.save()
                item.delete()
            return redirect(reverse('store:home'))
        except Exception as e:
            print(e)
            return HttpResponse(-1)