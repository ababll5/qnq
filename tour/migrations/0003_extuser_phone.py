# -*- coding: utf-8 -*-
# Generated by Django 1.11 on 2020-02-14 06:46
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('tour', '0002_view_img'),
    ]

    operations = [
        migrations.AddField(
            model_name='extuser',
            name='phone',
            field=models.CharField(blank=True, max_length=11, null=True, verbose_name='手机号'),
        ),
    ]
