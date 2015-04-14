from django.shortcuts import render
from depositclaim.models import Deposit
from django.http import HttpResponse, HttpResponseRedirect
from depositclaim.forms import DepositForm, ClaimForm
from depositclaim import twitter_data
# Create your views here.

def index(request):
    return HttpResponse()


def deposit(request):
	deposited_item = Deposit()
	if request.method == 'POST':
		form = DepositForm(request.POST)
		if form.is_valid():
			deposited_item.first_name = form.cleaned_data['first_name']
			deposited_item.last_name = form.cleaned_data['last_name']
			deposited_item.details = form.cleaned_data['details']
			deposited_item.contact = form.cleaned_data['contact']
			deposited_item.item_deposited = form.cleaned_data['item_deposited']
			deposited_item.save()
			return HttpResponseRedirect('/depositclaim')
	else:
		form = DepositForm()

	return render(request, 'depositclaim/deposititems.html', {'form':form})

def claim(request):
	if request.method == 'POST':
		form = ClaimForm(request.POST)
		if form.is_valid():
			item = form.cleaned_data['item_lost']
			items = Deposit.objects.filter(item_deposited=item).order_by('deposit_date')[:5].reverse()
			return render(request,'depositclaim/claim.html', {'latest_items_lists' : items})
	else:
		form = ClaimForm()

	return render(request, 'depositclaim/claimitem.html', {'form':form})


	# if request.method == 'POST':
	# 	form = ClaimForm(request.POST)
	# 	if form.is_valid():

	# 		return HttpResponseRedirect('/depositclaim')

	# else:
	# 	form = ClaimForm()

	# return render(request, 'depositclaim/claimitems.html', {'form':form})
