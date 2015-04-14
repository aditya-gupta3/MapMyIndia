from django.contrib import admin
from depositclaim.models import Deposit


class DepositAdmin (admin.ModelAdmin):
	list_display = ('first_name','last_name','item_deposited','deposit_date')
admin.site.register(Deposit, DepositAdmin)
# Register your models here.
