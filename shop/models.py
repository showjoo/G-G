# -*- coding: utf-8 -*-
from django.db import models
from django.contrib.auth.models import AbstractUser


class User(AbstractUser):
    avatar = models.ImageField(upload_to='avatar/%Y/%m', default='avatar/default.png', max_length=200, blank=True, null=True, verbose_name='用户头像')
    balance=models.FloatField(default=0,verbose_name='余额')
    date_reg = models.DateTimeField(auto_now_add=True,verbose_name='注册时间')
    mobile=models.CharField(verbose_name='手机', max_length=11)
    address=models.CharField(verbose_name='地址', max_length=200)
    post=models.CharField(verbose_name='邮编', max_length=10)

    status=models.BooleanField(default=False, verbose_name='账户状态')

    class Meta:
        verbose_name = '用户'
        verbose_name_plural = verbose_name
        ordering = ['-id']

    def __unicode__(self):
        return self.username

class Fenlei(models.Model):
    title=models.CharField(verbose_name='分类名称', max_length=200)
    desc=models.CharField(verbose_name='分类描述', max_length=2000)


    class Meta:
        verbose_name = '商品分类'
        verbose_name_plural = verbose_name

    def __unicode__(self):
        return str(self.title)

        
# 订单模型
class Products(models.Model):
    title=models.CharField(verbose_name='名称', max_length=200)
    desc=models.TextField(verbose_name='商品描述')
    image=models.ImageField(upload_to='%Y/%m', default='default.png', max_length=200, blank=True, null=True, verbose_name='商品图片')
    ptype=models.ForeignKey(Fenlei, verbose_name='类型')
    price=models.FloatField(default=0,verbose_name='价格')
    stock=models.IntegerField(default=0,verbose_name='库存')
    time = models.DateTimeField(auto_now_add=True,verbose_name='上架时间')


    class Meta:
        verbose_name = '商品目录'
        verbose_name_plural = verbose_name

    def __unicode__(self):
        return str(self.title)

# 订单模型
class Order(models.Model):
    user=models.ForeignKey(User, blank=True, null=True, verbose_name='用户')
    product = models.IntegerField(default=0,verbose_name='商品编号')
    time = models.DateTimeField(auto_now_add=True,verbose_name='时间')
    money=models.FloatField(default=0,verbose_name='金额')


    class Meta:
        verbose_name = '订单'
        verbose_name_plural = verbose_name

    def __unicode__(self):
        return str(self.user)

# 订单模型
class Shopcar(models.Model):
    user=models.ForeignKey(User, blank=True, null=True, verbose_name='用户')
    product = models.IntegerField(default=0,verbose_name='商品编号')
    money=models.FloatField(default=0,verbose_name='金额')


    class Meta:
        verbose_name = '购物车'
        verbose_name_plural = verbose_name

    def __unicode__(self):
        return str(self.user)

