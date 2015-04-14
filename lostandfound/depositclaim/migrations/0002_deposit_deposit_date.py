# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import datetime
from django.utils.timezone import utc


class Migration(migrations.Migration):

    dependencies = [
        ('depositclaim', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='deposit',
            name='deposit_date',
            field=models.DateTimeField(default=datetime.datetime(2015, 3, 10, 0, 58, 48, 606050, tzinfo=utc)),
            preserve_default=True,
        ),
    ]
