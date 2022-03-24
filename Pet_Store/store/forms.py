from django import forms
from django.contrib.auth.models import User
from store.models import UserProfile, Review

class UserForm(forms.ModelForm):
    password = forms.CharField(widget=forms.PasswordInput())

    class Meta:
        model = User
        fields = ('username','email','password',)

class UserProfileForm(forms.ModelForm):
    class Meta:
        model = UserProfile
        fields = ('address','postcode','picture',)

class ReviewForm(forms.ModelForm):

    class Meta:
        model = Review
        fields = ('title', 'review')
