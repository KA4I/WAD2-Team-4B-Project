import os
os.environ.setdefault('DJANGO_SETTINGS_MODULE',
                        'pet_store_project.settings')

import django
django.setup()
from store.models import Category, Product, Cart, Review

def populate():

    toy_products = [{'uid':1,'name':'Squeaky Bone','description':'A toy bone that makes a sound!','price':2.99, 'likes': 1},
                    {'uid':2,'name':'Ball and String','description':'Fun for all animals (but mostly cats)','price':4.99, 'likes': 2},
                    {'uid':3,'name':'Cat Tower','description':'For cats to climb and make their home in.','price':10.99, 'likes': 4}]

    animal_products = [{'uid':4,'name':'Lizard','description':'Perfect if you are after a more exotic pet ','price':29.99, 'likes': 8},
                        {'uid':5,'name':'Ginger Cat','description':'Warning: This cat is known to eat tons of lasagne','price':39.99, 'likes': 16},
                        {'uid':6,'name':'Hamster','description':'Hey hey hey, he is just a little guy and it is his birthday','price':10.99, 'likes': 32}]

    food_products = [{'uid':7,'name':'Canned Dog Food','description':'Meat chunks in gravy, not safe for human consumption','price':1.99, 'likes': 64},
                    {'uid':8,'name':'Crickets','description':'A lizards favourite food, beware, they jump.','price':1.99, 'likes': 128},
                    {'uid':9,'name':'Canned Cat Food','description':'Meat chunks in brine, not safe for human comsumption','price':1.99, 'likes': 256}]

    cat = {'Toys':{'products':toy_products},
            'Animals':{'products':animal_products},
            'Food':{'products':food_products}}

    for cat, cat_data in cat.items():
        c = add_cat(cat)
        for p in cat_data['products']:
            add_product(c, p['name'], p['uid'], p['description'], p['price'], p['likes'])

    for c in Category.objects.all():
        for p in Product.objects.filter(category=c):
            print(f'- {c}: {p}')


def add_product(cat, name, uid, description, price=0.99, likes=0):
    p = Product.objects.get_or_create(category=cat, name=name, uid=uid, likes=likes)[0]
    p.description=description
    p.price=price
    p.save()
    return p

def add_cat(name):
    c = Category.objects.get_or_create(name=name)[0]
    c.save()
    return c

if __name__ == '__main__':
    print('Starting Store population script...')
    populate()