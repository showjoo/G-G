# -*- coding: utf-8 -*-
import logging
from django.shortcuts import render, redirect, HttpResponse
from django.core.urlresolvers import reverse
from django.conf import settings
from django.contrib.auth import logout, login, authenticate
from django.contrib.auth.hashers import make_password
from django.core.paginator import Paginator, InvalidPage, EmptyPage, PageNotAnInteger
from django.db import connection
from django.db.models import Count
from .models import *
from .forms import *
import json,datetime
from django.core import serializers



logger = logging.getLogger('shop.views')

# Create your views here.
def global_setting(request):
    # 站点基本信息
    SITE_URL = settings.SITE_URL
    SITE_NAME = settings.SITE_NAME
    SITE_DESC = settings.SITE_DESC
    carnum=range(1,50)

    return locals()

def index(request):
    goods=Products.objects.all()[:10]
    aa= goods[:5]
    return render(request, 'index.html', locals())

def products(request):
    goods=Products.objects.all()
    return render(request, 'shop/front/product_list.html', locals())

def plist(request):
    goods=Products.objects.all()[:10]

    return HttpResponse(json.dumps(data), content_type="application/json")

def plook(request):
    id=request.GET['id']
    product=Products.objects.get(id=id)
    return render(request, 'shop/front/productLook.html', locals())

def  addtocar(request):
    id=request.GET['id']
    amount=request.GET['amount']
    res=render(request, 'success.html', {'reason': '添加购物车成功！'})
    try:
        ck=request.COOKIES.get('mycart')
        ck+=","+id+"|"+amount
        res.set_cookie("mycart",ck)
    except:
        res.set_cookie("mycart",id+"|"+amount)
    
    return res


def removeProduct(request):

    res=render(request, 'success.html', {'reason': '删除商品成功！'})
    res.set_cookie("mycart","")
    return res




def  shopcar(request):
    info=request.COOKIES.get('mycart')
    cart=[]
    totalPrice=0
    print (info.split('|'))
    try:
        for item in info.split(","):
            car=Products.objects.get(id=info.split("|")[0])
            cart.append(car)
            totalPrice+=float(car.price)
    except:
        car=Products.objects.get(id=info.split("|")[0])
        cart.append(car) 
        totalPrice+=float(car.price)   
    return  render(request, 'shop/front/cart.html', locals())


def check(request):
    try:
        user=User.objects.get(username=request.user.username)
    except:
        return redirect('/login')
    fee=request.POST['num']
    fee=float(fee)
    if (user.balance-fee)<0:
        info='余额不足，无法转账！'
        return render(request, 'failure.html', {'reason': info})
    else:
        now=datetime.datetime.now()
        uorder=Order.objects.create(user=user,money=fee,cardnum =request.POST['account'],time=now)
        uorder.save()
        user.balance-=fee
        user.save()
        return render(request, 'success.html', {'reason': '转账成功！'})
        

def checkresult(request):
    od=Order.objects.get(id=request.GET['id'])
    user=User.objects.get(username=request.user.username)
    fee=request.GET['fee']
    user.balance=user.balance-float(fee)
    user.save()
    od.delete()
    return render(request, 'success.html', {'reason': '结账成功！'})



def order(request):
    user=User.objects.get(username=request.user.username)
    info=request.COOKIES.get('mycart')
    cart=[]
    totalPrice=0
    try:
        for item in info.split(","):
            car=Products.objects.get(id=info.split("|")[0])
            cart.append(car)
            totalPrice+=float(car.price)*int(info.split("|")[1])
            uorder=Order.objects.create(user_id=user,product=car.id,money=float(car.price)*int(info.split("|")[1]))
            uorder.save()
    except:
        car=Products.objects.get(id=info.split("|")[0])
        cart.append(car) 
        totalPrice+=float(car.price) 

    receiver=User.objects.get(username=request.user.username)


    return render(request,'shop/front/order.html',locals())

def usercenter(request):
    try:
        user=User.objects.get(username=request.user.username)
        print (user)
    except:
        return redirect('/login')


    return render(request,'shop/front/usercenter.html',locals())  

def confirm(request):
    try:
        user=User.objects.get(username=request.user.username)
        t2=request.POST['datet']+" "+request.POST['timet']
        t1=request.POST['dates']+" "+request.POST['times']
        tt1=datetime.datetime.strptime(t1, "%Y-%m-%d %H:%M")
        tt2=datetime.datetime.strptime(t2, "%Y-%m-%d %H:%M")

        od=Order.objects.filter(time__range=(tt1, tt2))
        return render(request, 'record.html', locals())
    except Exception as e:
        print (e)
        # return render(request, 'failure.html', {'reason': e})



def  saveOrder(request):

    return render(request, 'success.html', {'reason': '订单提交成功！跳转支付页面。。。'})



# 注销
def do_logout(request):
    try:
        logout(request)
    except Exception as e:
        print (e)
        logger.error(e)
    return redirect('/')

# 注册
def do_reg(request):
    try:
        if request.method == 'POST':
            reg_form = RegForm(request.POST)
            if reg_form.is_valid():
                # 注册
                user = User.objects.create(username=reg_form.cleaned_data["username"],
                                    password=make_password(reg_form.cleaned_data["password"]),)
                user.save()

                # 登录
                user.backend = 'django.contrib.auth.backends.ModelBackend' # 指定默认的登录验证方式
                login(request, user)
                return redirect("/")
            else:
                return render(request, 'failure.html', {'reason': reg_form.errors})
        else:
            reg_form = RegForm()
    except Exception as e:
        logger.error(e)
    return render(request, 'reg.html', locals())



# 登录
def do_login(request):
    try:
        if request.method == 'POST':
            login_form = LoginForm(request.POST)
            if login_form.is_valid():
                # 登录
                username = login_form.cleaned_data["username"]
                password = login_form.cleaned_data["password"]
                user = authenticate(username=username, password=password)
                print (user)
                if user is not None:
                    print ("==66666666ooo")
                    user.backend = 'django.contrib.auth.backends.ModelBackend' # 指定默认的登录验证方式
                    login(request, user)
                    
                    if user.is_superuser== 1:
                        return redirect('/admin/')
                    else:
                        return redirect('/')
                   
                else:
                    
                    return render(request, 'failure.html', {'reason': '登录验证失败'})
            else:
                return render(request, 'failure.html', {'reason': login_form.errors})
        else:
            return render(request, 'login.html',locals())

    except Exception as e:
        logger.error(e)
        return render(request, 'failure.html', {'reason': e})
    


def search(request):
    goods=Products.objects.filter(title__contains=request.POST['kw'])
    return render(request,'shop/front/product_list.html',locals())