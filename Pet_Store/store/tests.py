from django.test import TestCase
from django.urls import reverse
from django.conf import settings
import os
import importlib
from django.contrib.auth.models import User
from store.models import Category, Product, UserProfile, Review
from django.forms import fields as django_fields
FAILURE_HEADER = f"{os.linesep}{os.linesep}{os.linesep}================{os.linesep}TwD TEST FAILURE =({os.linesep}================{os.linesep}"
FAILURE_FOOTER = f"{os.linesep}"
# Create your tests here.


class InstallApps(TestCase):
    def test_is_store_app_configured(self):
        is_app_configured = 'store' in settings.INSTALLED_APPS

        self.assertTrue(is_app_configured, f"{FAILURE_HEADER}The store app is missing from installed app{FAILURE_FOOTER}")

    def test_is_registration_configured(self):
        is_registration = 'registration' in settings.INSTALLED_APPS

        self.assertTrue(is_registration, f"{FAILURE_HEADER}The registration is missing from installed app{FAILURE_FOOTER}")

    def test_is_crispy_form_configured(self):
        is_crispy = 'crispy_forms' in settings.INSTALLED_APPS

        self.assertTrue(is_crispy, f"{FAILURE_HEADER}The crispy form is missing from installed app{FAILURE_FOOTER}")


class Templatetests(TestCase):
    def setUp(self):
        self.project_base_dir = os.getcwd()
        self.templates_dir = os.path.join(self.project_base_dir, 'templates')
        self.store_templates_dir = os.path.join(self.templates_dir, 'store')
        self.register_templates_dir = os.path.join(self.templates_dir, 'registration')

    def test_templates_directory(self):
        directory_exists = os.path.isdir(self.templates_dir)
        self.assertTrue(directory_exists, f"{FAILURE_HEADER}The templates directory does not exist{FAILURE_FOOTER}")

    def test_store_templates_directory(self):
        directory_exists = os.path.isdir(self.store_templates_dir)
        self.assertTrue(directory_exists, f"{FAILURE_HEADER}The store templates directory does not exist{FAILURE_FOOTER}")

    def test_register_templates_directory(self):
        directory_exists = os.path.isdir(self.register_templates_dir)
        self.assertTrue(directory_exists, f"{FAILURE_HEADER}The registration templates directory does not exist{FAILURE_FOOTER}")

    def test_template_dir_setting(self):
        variable_exists = 'TEMPLATE_DIR'
        self.assertTrue(variable_exists, f"{FAILURE_FOOTER}There is no TEMPLATE_DIR in settings{FAILURE_HEADER}")

        template_dir_value = os.path.normpath(settings.TEMPLATE_DIR)
        template_dir_computed = os.path.normpath(self.templates_dir)
        self.assertEqual(template_dir_value, template_dir_computed, f"{FAILURE_HEADER}TEMPLATE_DIR did not point to the expected path{FAILURE_FOOTER}")

    def test_templates_exists(self):
        home_path = os.path.join(self.store_templates_dir, 'home.html')
        about_path = os.path.join(self.store_templates_dir, 'about.html')
        base_path = os.path.join(self.store_templates_dir, 'base.html')
        cart_path = os.path.join(self.store_templates_dir, 'cart.html')
        category_path = os.path.join(self.store_templates_dir, 'category.html')
        contact_path = os.path.join(self.store_templates_dir, 'contact.html')
        icon_path = os.path.join(self.store_templates_dir, 'icon.html')
        pagination_path = os.path.join(self.store_templates_dir, 'pagination.html')
        product_path = os.path.join(self.store_templates_dir, 'product.html')
        profile_path = os.path.join(self.store_templates_dir, 'profile.html')
        profile_registration_path = os.path.join(self.store_templates_dir, 'profile_registration.html')
        review_path = os.path.join(self.store_templates_dir, 'review.html')
        search_path = os.path.join(self.store_templates_dir, 'search.html')
        show_product_path = os.path.join(self.store_templates_dir, 'show_product.html')
        login_path = os.path.join(self.register_templates_dir, 'login.html')
        logout_path = os.path.join(self.register_templates_dir, 'logout.html')


        self.assertTrue(os.path.isfile(home_path), f"{FAILURE_HEADER}The home.html does not exist{FAILURE_FOOTER}")
        self.assertTrue(os.path.isfile(about_path), f"{FAILURE_HEADER}The about.html does not exist{FAILURE_FOOTER}")
        self.assertTrue(os.path.isfile(base_path), f"{FAILURE_HEADER}The base.html does not exist{FAILURE_FOOTER}")
        self.assertTrue(os.path.isfile(cart_path), f"{FAILURE_HEADER}The cart.html does not exist{FAILURE_FOOTER}")
        self.assertTrue(os.path.isfile(category_path), f"{FAILURE_HEADER}The category.html does not exist{FAILURE_FOOTER}")
        self.assertTrue(os.path.isfile(contact_path),
                        f"{FAILURE_HEADER}The contact.html does not exist{FAILURE_FOOTER}")
        self.assertTrue(os.path.isfile(icon_path),
                        f"{FAILURE_HEADER}The icon.html does not exist{FAILURE_FOOTER}")
        self.assertTrue(os.path.isfile(pagination_path),
                        f"{FAILURE_HEADER}The pagination.html does not exist{FAILURE_FOOTER}")
        self.assertTrue(os.path.isfile(product_path),
                        f"{FAILURE_HEADER}The product.html does not exist{FAILURE_FOOTER}")
        self.assertTrue(os.path.isfile(profile_path),
                        f"{FAILURE_HEADER}The profile.html does not exist{FAILURE_FOOTER}")
        self.assertTrue(os.path.isfile(profile_registration_path),
                        f"{FAILURE_HEADER}The profile_registration.html does not exist{FAILURE_FOOTER}")
        self.assertTrue(os.path.isfile(review_path),
                        f"{FAILURE_HEADER}The review.html does not exist{FAILURE_FOOTER}")
        self.assertTrue(os.path.isfile(search_path),
                        f"{FAILURE_HEADER}The search.html does not exist{FAILURE_FOOTER}")
        self.assertTrue(os.path.isfile(show_product_path),
                        f"{FAILURE_HEADER}The show_product.html does not exist{FAILURE_FOOTER}")
        self.assertTrue(os.path.isfile(login_path),
                        f"{FAILURE_HEADER}The login.html does not exist{FAILURE_FOOTER}")
        self.assertTrue(os.path.isfile(logout_path),
                        f"{FAILURE_HEADER}The logout.html does not exist{FAILURE_FOOTER}")


class StaticMediaTests(TestCase):
    def setUp(self):
        self.project_base_dir = os.getcwd()
        self.static_dir = os.path.join(self.project_base_dir, 'static')
        self.media_dir = os.path.join(self.project_base_dir, 'media')

    def test_static_dir(self):
        static_dir_exist = os.path.isdir(self.static_dir)
        static_css_exist = os.path.isdir(os.path.join(self.static_dir, 'css'))
        static_images_exist = os.path.isdir(os.path.join(self.static_dir, 'images'))
        static_js_exist = os.path.isdir(os.path.join(self.static_dir, 'js'))

        self.assertTrue(static_dir_exist, f"{FAILURE_HEADER}The static dir is not exist{FAILURE_FOOTER}")
        self.assertTrue(static_css_exist, f"{FAILURE_HEADER}The css dir in static dir is not exist{FAILURE_FOOTER}")
        self.assertTrue(static_images_exist,
                        f"{FAILURE_HEADER}The images dir in static dir is not exist{FAILURE_FOOTER}")
        self.assertTrue(static_js_exist, f"{FAILURE_HEADER}The js dir in the static dir is not exist{FAILURE_FOOTER}")

    def test_media_dir(self):
        media_dir_exist= os.path.isdir(self.media_dir)
        media_profile_images_exist = os.path.isdir(os.path.join(self.media_dir, 'profile_images'))

        self.assertTrue(media_dir_exist, f"{FAILURE_HEADER}The media dir is not exist{FAILURE_FOOTER}")
        self.assertTrue(media_profile_images_exist,
                        f"{FAILURE_HEADER}The profile_images dir in the media dir is not exist){FAILURE_FOOTER}")

    def test_configuration(self):
        static_dir_exists = 'STATIC_DIR' in dir(settings)
        self.assertTrue(static_dir_exists,
                        f"{FAILURE_HEADER}The settings.py module does not have the variable STATIC_DIR.{FAILURE_FOOTER}")

        expected_path = os.path.normpath(self.static_dir)
        static_path = os.path.normpath(settings.STATIC_DIR)
        self.assertEqual(expected_path, static_path,
                         f"{FAILURE_HEADER}It should point to your project root{FAILURE_FOOTER}")

        staticfiles_dirs_exists = 'STATICFILES_DIRS' in dir(settings)
        self.assertTrue(staticfiles_dirs_exists,
                        f"{FAILURE_HEADER}The STATICFILES_DIRS "
                        f"is not present in settings.py module{FAILURE_FOOTER}")
        self.assertEqual([static_path], settings.STATICFILES_DIRS,
                         f"{FAILURE_HEADER}STATICFILES_DIRS setting does not match what is expected.{FAILURE_FOOTER}")

        staticfiles_dirs_exists = 'STATIC_URL' in dir(settings)
        self.assertTrue(staticfiles_dirs_exists,
                        f"{FAILURE_HEADER}The STATIC_URL variable has not been defined in settings.py.{FAILURE_FOOTER}")
        self.assertEqual('/static/', settings.STATIC_URL,
                         f"{FAILURE_HEADER}STATIC_URL does not meet the expected value of /static/. {FAILURE_FOOTER}")

        media_dir_exists = 'MEDIA_DIR' in dir(settings)
        self.assertTrue(media_dir_exists,
                        f"{FAILURE_HEADER}The MEDIA_DIR variable in settings.py has not been defined.{FAILURE_FOOTER}")

        expected_path = os.path.normpath(self.media_dir)
        media_path = os.path.normpath(settings.MEDIA_DIR)
        self.assertEqual(expected_path, media_path,
                         f"{FAILURE_HEADER}The MEDIA_DIR setting does not point to the correct path. {FAILURE_FOOTER}")

        media_root_exists = 'MEDIA_ROOT' in dir(settings)
        self.assertTrue(media_root_exists,
                        f"{FAILURE_HEADER}The MEDIA_ROOT setting has not been defined.{FAILURE_FOOTER}")

        media_root_path = os.path.normpath(settings.MEDIA_ROOT)
        self.assertEqual(media_path, media_root_path,
                         f"{FAILURE_HEADER}The value of MEDIA_ROOT does not equal the value of MEDIA_DIR.{FAILURE_FOOTER}")

        media_url_exists = 'MEDIA_URL' in dir(settings)
        self.assertTrue(media_url_exists,
                        f"{FAILURE_HEADER}The setting MEDIA_URL has not been defined in settings.py.{FAILURE_FOOTER}")

        media_url_value = settings.MEDIA_URL
        self.assertEqual('/media/', media_url_value,
                         f"{FAILURE_HEADER}The value of the MEDIA_URL setting does not equal /media/{FAILURE_FOOTER}")


class ModelTests(TestCase):

    def setUp(self):
        Category.objects.get_or_create(name="Animal", views=188, icon="images/2965100.png")
        user = User.objects.create_user(username="TestUser", email="email@email.com", password="123456user")

       

    def test_category_model(self):
        category_py = Category.objects.get(name="Animal")

        self.assertEqual(category_py.views, 188, f"{FAILURE_HEADER}Test Category views failed{FAILURE_FOOTER}")
        self.assertEqual(category_py.icon, "images/2965100.png",
                         f"{FAILURE_HEADER}Test Category icon failed{FAILURE_FOOTER}")

  
    def test_str_method(self):
        category_py = Category.objects.get(name="Animal")

        self.assertEqual(str(category_py), "Animal",
                         f"{FAILURE_HEADER} The __str__ method is not implemented correctly in category{FAILURE_FOOTER}")
       

class FormClassTest(TestCase):
    def test_form_exists(self):
        project_path = os.getcwd()
        store_app_path = os.path.join(project_path, 'store')
        forms_path = os.path.join(store_app_path, 'forms.py')
        self.assertTrue(os.path.exists(forms_path), f"{FAILURE_HEADER}The forms.py does not exist")

    def user_form_test(self):
        import store.forms
        self.assertTrue('UserProfileForm' in dir(store.forms),
                        f"{FAILURE_HEADER}The class UserProfileForm could not be found.{FAILURE_FOOTER}")

        from store.forms import UserProfileForm
        user_profile = UserProfileForm()

        self.assertEqual(type(user_profile.__dict__['instance']), UserProfile,
                         f"{FAILURE_HEADER}The UserProfileForm does not link to the UserProfile model. {FAILURE_FOOTER}")
        fields = user_profile.fields

        expected_fields = {
            'address': django_fields.CharField,
            'postcode': django_fields.CharField,
            'picture': django_fields.ImageField,
        }

        for expected_field_name in expected_fields:
            expected_field = expected_fields[expected_field_name]

            self.assertTrue(expected_field_name in fields.keys(),
                            f"{FAILURE_HEADER}The field '{expected_field_name}' was not found in your CategoryForm implementation.{FAILURE_FOOTER}")
            self.assertEqual(expected_field, type(fields[expected_field_name]),
                             f"{FAILURE_HEADER}The field '{expected_field_name}' in UserProfileForm was not of the expected type '{type(fields[expected_field_name])}'.{FAILURE_FOOTER}")

    def review_form_test(self):
        import store.forms
        self.assertTrue('ReviewForm' in dir(store.forms),
                        f"{FAILURE_HEADER}The class ReviewForm could not be found.{FAILURE_FOOTER}")

        from store.forms import ReviewForm
        review = ReviewForm()

        self.assertEqual(type(review.__dict__['instance']), Review,
                         f"{FAILURE_HEADER}The ReviewForm does not link to the Review model. {FAILURE_FOOTER}")
        fields = review.fields

        expected_fields = {
            'title': django_fields.CharField,
            'review': django_fields.TextField,
        }

        for expected_field_name in expected_fields:
            expected_field = expected_fields[expected_field_name]

            self.assertTrue(expected_field_name in fields.keys(),
                            f"{FAILURE_HEADER}The field '{expected_field_name}' was not found in your CategoryForm implementation.{FAILURE_FOOTER}")
            self.assertEqual(expected_field, type(fields[expected_field_name]),
                             f"{FAILURE_HEADER}The field '{expected_field_name}' in UserProfileForm was not of the expected type '{type(fields[expected_field_name])}'.{FAILURE_FOOTER}")


class AdminInterfaceTests(TestCase):
    def setUp(self):
        User.objects.create_superuser("testAdmin", 'email@email.com', "123456admin")
        self.client.login(username='testAdmin', password='123456admin')
        category = Category.objects.get_or_create(name="TestCategory")[0]

    def test_admin_interface_accessible(self):
        response = self.client.get('/admin/')
        self.assertEqual(response.status_code, 200,
                         f"{FAILURE_HEADER}The admin interface is not accessible. {FAILURE_FOOTER}")

    def test_models_present(self):
        response = self.client.get('/admin/')
        response_body = response.content.decode()


        self.assertTrue('Product' in response_body,
                        f"{FAILURE_HEADER}The Page model was not found in the admin interface.{FAILURE_FOOTER}")
        self.assertTrue('Cart' in response_body,
                        f"{FAILURE_HEADER}The Cart model was not found in the admin interface.{FAILURE_FOOTER}")
        self.assertTrue('Review' in response_body,
                        f"{FAILURE_HEADER}The Review model was not found in the admin interface. {FAILURE_FOOTER}")



class HomePageTests(TestCase):
    def setUp(self):
        self.views_module = importlib.import_module('store.views')
        self.views_module_listing = dir(self.views_module)
        self.project_urls_module = importlib.import_module('pet_store_project.urls')
        self.response = self.client.get(reverse('store:home'))

    def test_view_exists(self):
        name_exists = 'home' in self.views_module_listing
        is_callable = callable(self.views_module.home)

        self.assertTrue(name_exists, f"{FAILURE_HEADER}The home() view does not exist{FAILURE_FOOTER}")

        self.assertTrue(is_callable, f"{FAILURE_HEADER}The home does not seem to be a function{FAILURE_FOOTER}")

    def test_mapping_exists(self):
        home_mapping_exists = False

        for mapping in self.project_urls_module.urlpatterns:
            if hasattr(mapping, 'name'):
                if mapping.name == 'home':
                    home_mapping_exists = True

        self.assertTrue(home_mapping_exists,
                        f"{FAILURE_HEADER}The home URL mapping could not be found.{FAILURE_FOOTER}")

        self.assertEquals(reverse('store:home'), '/store/home/',
                          f"{FAILURE_HEADER}The home URL lookup failed{FAILURE_FOOTER}")

    def test_response(self):

        self.assertEqual(self.response.status_code, 200,
                         f"{FAILURE_HEADER}Requesting the index page failed. Check your URLs and view.{FAILURE_FOOTER}")

    def test_home_uses_template(self):

        self.assertTemplateUsed(self.response, 'store/home.html',
                                f"{FAILURE_HEADER}The home page does not use expected html{FAILURE_FOOTER}")

    def test_home_uses_context_dictionary(self):
        self.assertTrue('categories' in self.response.context,
                        f"{FAILURE_HEADER}The categories is not passed to the home.html{FAILURE_FOOTER}")

        self.assertTrue('product_pages' in self.response.context,
                        f"{FAILURE_HEADER}The products is not passed to the home.html{FAILURE_FOOTER}")

        self.assertTrue('visits' in self.response.context,
                        f"{FAILURE_HEADER}The visits is not passed to the home.html{FAILURE_FOOTER}")

    def test_home_starts_with_doctype(self):
        self.assertTrue(self.response.content.decode().startswith('<!DOCTYPE html>'),
                        f"{FAILURE_HEADER}The home.html template does not start with <!DOCTYPE html> {FAILURE_FOOTER}")


class AboutPageTests(TestCase):
    def setUp(self):
        self.views_module = importlib.import_module('store.views')
        self.views_module_listing = dir(self.views_module)
        self.response = self.client.get(reverse('store:about'))

    def test_views_exists(self):
        name_exists = 'about' in self.views_module_listing
        is_callable = callable(self.views_module.about)

        self.assertTrue(name_exists,
                        f"{FAILURE_HEADER}No view for about page{FAILURE_FOOTER}")
        self.assertTrue(is_callable,
                        f"{FAILURE_HEADER}cannot execute about page{FAILURE_FOOTER}")

    def test_mapping_exists(self):
        self.assertEquals(reverse('store:about'), '/store/about/', f"{FAILURE_FOOTER}Not about URL found{FAILURE_FOOTER}")

    def test_response(self):

        self.assertEqual(self.response.status_code, 200, f"{FAILURE_HEADER}The server did not responding on the about page.{FAILURE_FOOTER}")

    def test_use_template(self):
        self.assertTemplateUsed(self.response, 'store/about.html',
                                f"{FAILURE_HEADER}The about page does not use expected html{FAILURE_FOOTER}")

    def test_about_uses_context_dictionary(self):
        self.assertTrue('boldmessage' in self.response.context,
                        f"{FAILURE_HEADER}The categories is not passed to the home.html{FAILURE_FOOTER}")

        message = self.response.context['boldmessage']
        expected = 'A Scottish pet store established in 2022!'
        self.assertEqual(message, expected,
                         f"{FAILURE_HEADER}The boldmessage being sent to the about.html template does not match what is expected.{FAILURE_FOOTER}")

    def test_about_starts_with_doctype(self):
        self.assertTrue(self.response.content.decode().startswith('<!DOCTYPE html>'),
                        f"{FAILURE_HEADER}The about.html template does not start with <!DOCTYPE html> {FAILURE_FOOTER}")


class ContactPageTests(TestCase):
    def setUp(self):
        self.views_module = importlib.import_module('store.views')
        self.views_module_listing = dir(self.views_module)
        self.response = self.client.get(reverse('store:contact'))

    def test_views_exists(self):
        name_exists = 'contact' in self.views_module_listing
        is_callable = callable(self.views_module.contact)

        self.assertTrue(name_exists,
                        f"{FAILURE_HEADER}No view for about contact page{FAILURE_FOOTER}")
        self.assertTrue(is_callable,
                        f"{FAILURE_HEADER}cannot execute contact page{FAILURE_FOOTER}")

    def test_mapping_exists(self):
        self.assertEquals(reverse('store:contact'), '/store/contact/', f"{FAILURE_FOOTER}Not about URL found{FAILURE_FOOTER}")

    def test_response(self):

        self.assertEqual(self.response.status_code, 200, f"{FAILURE_HEADER}The server did not responding on the contact page.{FAILURE_FOOTER}")

    def test_use_template(self):
        self.assertTemplateUsed(self.response, 'store/contact.html',
                                f"{FAILURE_HEADER}The contact page does not use expected html{FAILURE_FOOTER}")

    def test_contact_uses_context_dictionary(self):
        self.assertTrue('boldmessage' in self.response.context,
                        f"{FAILURE_HEADER}The categories is not passed to the home.html{FAILURE_FOOTER}")

        message = self.response.context['boldmessage']
        expected = 'A Scottish pet store established in 2022!'
        self.assertEqual(message, expected,
                         f"{FAILURE_HEADER}The boldmessage being sent to the contact.html template does not match what is expected.{FAILURE_FOOTER}")

    def test_about_starts_with_doctype(self):
        self.assertTrue(self.response.content.decode().startswith('<!DOCTYPE html>'),
                        f"{FAILURE_HEADER}The contact.html template does not start with <!DOCTYPE html> {FAILURE_FOOTER}")


def create_user_object():
    user = User.objects.get_or_create(username='testuser',
                                      first_name='Test',
                                      last_name='User',
                                      email='test@test.com')[0]
    user.set_password('testabc123')
    user.save()

    return user


class LoginTests(TestCase):
    def test_login_url_exists(self):
        url = ''

        try:
            url = reverse('auth_login')
        except:
            pass

        self.assertEqual(url, '/accounts/login/',
                         f"{FAILURE_HEADER}No login url{FAILURE_FOOTER}")

    def test_login_functionality(self):
        user_object = create_user_object()

        response = self.client.post(reverse('auth_login'), {'username': 'testuser', 'password': 'testabc123'})

        try:
            self.assertEqual(user_object.id, int(self.client.session['_auth_user_id']),
                             f"{FAILURE_HEADER}id does not match{FAILURE_FOOTER}")
        except KeyError:
            self.assertTrue(False,
                            f"{FAILURE_HEADER}Did not log the user in{FAILURE_FOOTER}")

        self.assertEqual(response.status_code, 302,
                         f"{FAILURE_HEADER}There is no redirection{FAILURE_FOOTER}")
        self.assertEqual(response.url, reverse('store:home'),
                         f"{FAILURE_HEADER}Did not redirect to the home page.{FAILURE_FOOTER}")


class LogoutTests(TestCase):
    def test_request(self):
        user_object = create_user_object()
        self.client.login(username='testuser', password='testabc123')
        try:
            self.assertEqual(user_object.id, int(self.client.session['_auth_user_id']),
                             f"{FAILURE_HEADER}Cannot log user in {FAILURE_FOOTER}")
        except KeyError:
            self.assertTrue(False,
                            f"{FAILURE_HEADER}When attempting to log a user in, it failed..{FAILURE_FOOTER}")

        response = self.client.get(reverse('store:logout'))
        self.assertEqual(response.status_code, 302,
                         f"{FAILURE_HEADER}Logging out a user should cause a redirect.{FAILURE_FOOTER}")
        self.assertEqual(response.url, reverse('store:home'),
                         f"{FAILURE_HEADER}When logging out a user,should then redirect them to the homepage. {FAILURE_FOOTER}")
        self.assertTrue('_auth_user_id' not in self.client.session,
                        f"{FAILURE_HEADER}Did not log the user out{FAILURE_FOOTER}")


class RegistrationTest(TestCase):

    def test_registration_view_exists(self):
        url = ''
        try:
            url = reverse('registration_register')
        except:
            pass
        self.assertEqual(url, '/accounts/register/', f"{FAILURE_HEADER}Fail to map the register{FAILURE_FOOTER}")


    def test_registration_get_response(self):
        request = self.client.get(reverse('registration_register'))
        content = request.content.decode('utf-8')

        self.assertTrue('action="."' in content,
                        f"{FAILURE_HEADER}Point to the wrong{FAILURE_FOOTER}")


class PopulationScriptTests(TestCase):
    def setUp(self):
        try:
            import populate_store
        except ImportError:
            raise ImportError(f"{FAILURE_HEADER}Can not import populate_store{FAILURE_FOOTER}")

        if 'populate' not in dir(populate_store):
            raise NameError(f"{FAILURE_HEADER}did not find populate method{FAILURE_FOOTER}")

        populate_store.populate()

    def test_categories(self):
        categories = Category.objects.filter()
        categories_len = len(categories)
        categories_strs = map(str, categories)

        self.assertEqual(categories_len, 3,
                         f"{FAILURE_HEADER}Expecting 3 categories to be created found {categories_len}.{FAILURE_FOOTER}")
        self.assertTrue('Toys' in categories_strs,
                        f"{FAILURE_HEADER}The category 'Toys' was expected{FAILURE_FOOTER}")
        self.assertTrue('Animals' in categories_strs,
                        f"{FAILURE_HEADER}The category 'Animals' was expected{FAILURE_FOOTER}")
        self.assertTrue('Food' in categories_strs,
                        f"{FAILURE_HEADER}The category 'Food' was expected{FAILURE_FOOTER}")

    def check_category_pages(self, category, product_titles):
        category = Category.objects.get(name=category)
        product = Product.objects.filter(category=category)
        product_len= len(product)
        product_titles_len = len(product_titles)

        self.assertEqual(product_len, len(product_titles),
                         f"{FAILURE_HEADER}Expected {product_titles_len} products in the category produced by populate_rango{FAILURE_FOOTER}")

        for name in product_titles:
            try:
                product = Product.objects.get(name=name)
            except product.DoesNotExist:
                raise ValueError(
                    f"{FAILURE_HEADER}The product '{name}' belonging to category '{category}' was not found in the database{FAILURE_FOOTER}")

    def test_products(self):
        details = {'Toys':
                       ['Squeaky Bone', 'Ball and String','Cat Tower'],
                   'Animals':
                       ['Lizard', 'Ginger Cat', 'Hamster'],
                   'Food':
                       ['Canned Dog Food', 'Crickets', 'Canned Cat Food']}

        for category in details:
            product_titles = details[category]
            self.check_category_pages(category, product_titles)


