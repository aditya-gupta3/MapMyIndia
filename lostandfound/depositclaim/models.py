from django.db import models
import datetime
from django.utils import timezone


class Deposit(models.Model):
	first_name = models.CharField(max_length=50)
	last_name = models.CharField(max_length=50)
	item_deposited = models.CharField(max_length=100)
	now = timezone.now()
	deposit_date = models.DateTimeField(default= now)
	details = models.CharField(max_length=100)
	contact = models.CharField(max_length=100)
	def __str__(self):              # __unicode__ on Python 2
		return self.item_deposited

