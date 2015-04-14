from django import forms

class DepositForm(forms.Form):
	CHOICES=[('id','Wesleyan ID'),('idandkey','WesID+Key'),('key','Key')]
	first_name = forms.CharField(label='First name', max_length=100)
	last_name = forms.CharField(label='Last Name', max_length=100)
	contact = forms.CharField(label='Contact', max_length=100)
	item_deposited = forms.ChoiceField(label='Item Deposited', choices=CHOICES, widget=forms.RadioSelect())
	details = forms.CharField(label='Details', max_length=100)

class ClaimForm(forms.Form):
	CHOICES=[('id','Wesleyan ID'),('idandkey','WesID+Key'),('key','Key')]
	first_name = forms.CharField(label='First name', max_length=100)
	last_name = forms.CharField(label='Last Name', max_length=100)
	contact = forms.CharField(label='Contact', max_length=100)
	item_lost = forms.ChoiceField(label='Item Lost', choices=CHOICES, widget=forms.RadioSelect())
