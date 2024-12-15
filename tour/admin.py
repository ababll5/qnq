# -*- coding: utf-8 -*-
from django.contrib import admin
from .models import *



admin.site.site_header = '旅游网站后台管理'
admin.site.index_title = '旅游网站管理'
admin.site.site_title = '旅游网站管理'

# Register your models here.
# class PlantAdmin(admin.ModelAdmin):
# 	fields=('book_name','pic','tag','summary','score','pubinfo')
# 	list_display = ('id','title','tag','score')
# 	list_display_links = ('id','title',)

# Register your models here.
admin.site.register(View)
admin.site.register(ExtUser)
admin.site.register(Score)
admin.site.register(Rating)
admin.site.register(Article)
admin.site.register(Food)
