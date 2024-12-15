# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.contrib.auth.models import User
from django.db import models

# Create your models here.

class View(models.Model):
    id = models.CharField(max_length=50, primary_key=True)  # city_pinyin + '_' + view_pinyin，暂时用数字，之后有时间再改，还有图片的前缀
    img = models.ImageField(upload_to='static/upload/', default='static/upload/default.png', blank=True, null=True, verbose_name='景点图片')
    price = models.FloatField(default=0,verbose_name="门票价格")  # 如: 20 
    province = models.CharField(max_length=20,verbose_name="省份")  # 如福建
    city = models.CharField(max_length=20,verbose_name="城市")  # 如南宁 
    view_name = models.CharField(max_length=25,verbose_name="景点名称")  # 景点名称
    view_desc = models.TextField(verbose_name="景点描述信息")  # 景点描述信息
    view_rate = models.CharField(max_length=5,verbose_name="景点打分")  # 景点打分 
    advise_time = models.CharField(max_length=20,verbose_name="建议游玩时间")  # 建议游玩时间
    address = models.CharField(max_length=100, verbose_name="详细地址", blank=True, null=True)  # 新增字段
    
    class Meta:
        verbose_name = '景点'
        verbose_name_plural = verbose_name 
        ordering = ['-id']

    def __str__(self):
        address_str = self.address if self.address is not None else ' '
        return self.province + '-' + self.city + '-' + address_str + '-' + self.view_name + '-' + self.id


class ExtUser(models.Model):
    user = models.OneToOneField(User,on_delete=models.CASCADE)
    number = models.IntegerField(primary_key=True)
    age = models.IntegerField(blank=True, null=True,verbose_name="年龄")
    sex = models.CharField(max_length=2, blank=True, null=True,verbose_name="性别")
    phone = models.CharField(max_length=11, blank=True, null=True,verbose_name="手机号")
    address = models.CharField(max_length=30, blank=True, null=True,verbose_name="地址")
    autograph = models.CharField(max_length=50, blank=True, null=True,verbose_name="个性签名")
    greet = models.CharField(max_length=50, blank=True, null=True,verbose_name="问候语")
    labels = models.CharField(max_length=50, blank=True, null=True,verbose_name="标签")
    register_date = models.DateField(auto_now=True)

    class Meta:
        verbose_name = '用户'
        verbose_name_plural = verbose_name
        # ordering = ['-id']

    def __str__(self):
        return self.user.username


class Article(models.Model):
    title = models.CharField(max_length=255, blank=True)
    author = models.ForeignKey(User,on_delete=models.CASCADE)
    content = models.TextField(blank=True)
    time = models.DateTimeField(blank=True, auto_now=True)

    class Meta:
        verbose_name = '旅游攻略'
        verbose_name_plural = verbose_name
        # ordering = ['-id']

    def __str__(self):
        return self.title



class Comment(models.Model):
    user = models.ForeignKey(User,on_delete=models.CASCADE)
    view = models.ForeignKey(View,on_delete=models.CASCADE)
    comment = models.CharField(max_length=255, blank=True)
    comment_date = models.DateTimeField(blank=True, auto_now=True)

    class Meta:
        verbose_name = '评论'
        verbose_name_plural = verbose_name
        # ordering = ['-id']

    def __str__(self):
        return self.user.username


class Score(models.Model):
    user = models.ForeignKey(User,on_delete=models.CASCADE)
    view = models.ForeignKey(View,on_delete=models.CASCADE)
    rate = models.IntegerField(default=0)
    comment_date = models.DateTimeField(blank=True, auto_now=True)

    class Meta:
        verbose_name = '景点评分'
        verbose_name_plural = verbose_name
        # ordering = ['-id']

    def __str__(self):
        return self.user.username



class Hotel(models.Model):
    title = models.CharField(max_length=200,blank=True,null = False,verbose_name=u'酒店名称')
    pic = models.ImageField(upload_to="static/upload/",verbose_name=u'图片')
    intro = models.TextField(verbose_name=u'简介')
    price = models.FloatField(verbose_name=u'价格', default=0)
    tel=models.CharField(max_length=20,blank=True,verbose_name=u'电话')
    address = models.CharField(max_length=50, blank=True, null=True,verbose_name=u'地址')

    class Meta:
        verbose_name = '酒店'
        verbose_name_plural = verbose_name
        # ordering = ['-id']

    def __str__(self):
        return self.title

class Order(models.Model):
    hotel = models.ForeignKey(Hotel,on_delete=models.CASCADE)
    user = models.ForeignKey(User,on_delete=models.CASCADE)
    num=models.IntegerField(default=0,verbose_name='天数')
    price = models.FloatField(verbose_name=u'价格', default=0)
    date = models.CharField(max_length=20,blank=True,verbose_name=u'入驻时间')
    time = models.DateTimeField(blank=True, auto_now=True)

    class Meta:
        verbose_name = '订单'
        verbose_name_plural = verbose_name
        # ordering = ['-id']

    def __str__(self):
        return self.title
    

class Food(models.Model):
    food_id = models.CharField(max_length=50, primary_key=True)
    food_name = models.CharField(max_length=100)
    food_desc = models.TextField(verbose_name="美食描述信息")
    food_img = models.ImageField(upload_to='static/food/',default='static/food/default.png', blank=True, null=True, verbose_name='美食图片')
    food_price = models.FloatField(default=0,verbose_name="美食价格")
    food_rate = models.CharField(max_length=5,verbose_name="美食评分",blank=True,null=True)  
    f_province = models.CharField(max_length=20,verbose_name="省份")  # 如福建
    f_city = models.CharField(max_length=20,verbose_name="城市",blank=True,null=True)  # 如南宁
    create_time = models.DateTimeField(auto_now_add=True)
    update_time = models.DateTimeField(auto_now=True)

    class Meta:
        verbose_name = '美食'
        verbose_name_plural = verbose_name
        ordering = ['-food_id']


    def __str__(self):
        return self.food_name

class Food_Comment(models.Model):
    user = models.ForeignKey(User,on_delete=models.CASCADE)
    food = models.ForeignKey(Food,on_delete=models.CASCADE)
    comment = models.CharField(max_length=255, blank=True)
    comment_date = models.DateTimeField(blank=True, auto_now=True)

    class Meta:
        verbose_name = '美食评论'
        verbose_name_plural = verbose_name
        # ordering = ['-id']

    def __str__(self):
        return self.user.username


class Rating(models.Model):
    user = models.ForeignKey(User,on_delete=models.CASCADE)
    food = models.ForeignKey(Food,on_delete=models.CASCADE)
    rate = models.IntegerField(default=0)
    comment_date = models.DateTimeField(blank=True, auto_now=True)

    class Meta:
        verbose_name = '美食评分'
        verbose_name_plural = verbose_name
        # ordering = ['-id']

    def __str__(self):
        return self.user.username
    

    #Collection 用户和收藏，收藏景点，美食  主码：用户id+景点id+美食id