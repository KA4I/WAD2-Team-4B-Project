# pet_store_project

# Updates
To run, ensure you have pip installed django, pillow as well as:
* pip install -U django-registration-redux==2.2
* pip install bcrypt

You might also need to run:
* python manage.py migrate

Dropped the "supplier" and "courier" models from our database at reccommendation from the feedback we reciveved in the design spec.
We can add these back later but for now lets focus on getting the user facing work completed.

We don't need a full image model, we can use the ImageField within Django on Category and Product models.

Order and Review models exist, but are currently unused.

Used near-default bootstrap template for the base, we can change this later but it works for testing.

# To Do List: 
* Replace all views with the class-based approached to views seen in later chapters.
* Create like and review buttons on product, review button should link to a forum page to submit a review for product.
* Create add to cart buttons, cart model etc.
* Create order button from Cart page.
* Product and Category models currently have unused "views" fields, amend so views increment.
* Update home page to include list of most liked products.
* Add images to product model and category model, use models.ImageField to do so.
* Replace html, css, and other stylistic elements. Currently using Bootstrap default.

