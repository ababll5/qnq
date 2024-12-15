# coding:utf-8
"""TourRecSys URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.11/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.urls import re_path as url

from django.contrib import admin
from tour import views

urlpatterns = [
    url(r'^admin/', admin.site.urls),

    # 首页
    url(r'^$', views.init),
    url(r'^orders', views.orders),

    # 详情
    url(r'^detail', views.detail),# 景点
    url(r'^food_detail', views.food_detail),# 美食
    url(r'^look', views.look),# 单篇攻略详情
    url(r'^articles', views.articles),# 攻略总页面

    # 登录 & 注册 & 登出
    url(r'^login', views.sign_in),
    url(r'^register', views.register),
    url(r'^logout', views.sign_out),

    # 搜索
    url(r'^search', views.search),
    url(r'^food_search', views.food_search),

    # 用户发布
    url(r'^publish', views.publish),

    # 酒店
    url(r'^hotel', views.hotels),
    url(r'^live', views.live),

    # 用户信息
    url(r'^info', views.info),
    url(r'^my', views.my),

    #美食栏目
    url(r'^food_init', views.food_init),

    
]
