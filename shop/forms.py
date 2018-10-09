# -*- coding:utf-8 -*-
from django import forms
from django.conf import settings
from django.db.models import Q
from .models import *
import re

class LoginForm(forms.Form):
    '''
    登录Form
    '''
    username = forms.CharField(widget=forms.TextInput(attrs={"placeholder": "用户名", "required": "required",}),
                              max_length=24,error_messages={"required": "用户名不能为空",})
    password = forms.CharField(widget=forms.PasswordInput(attrs={"placeholder": "Password", "required": "required",}),
                              max_length=20,min_length=8,error_messages={"required": "密码不能为空","min_length":"密码必须大于8位"})

class RegForm(forms.Form):
    '''
    注册表单
    '''
    username = forms.CharField(widget=forms.TextInput(attrs={"placeholder": "用户名", "required": "required",}),
                              max_length=24,error_messages={"required": "用户名不能为空",})
    password1 = forms.CharField(widget=forms.PasswordInput(attrs={"placeholder": "设置密码", "required": "required",}),
                              max_length=20,min_length=8,error_messages={"required": "密码不能为空","min_length":"密码必须大于8位"})
    password2 = forms.CharField(widget=forms.PasswordInput(attrs={"placeholder": "确认密码", "required": "required", }),
                               max_length=20, min_length=8,
                               error_messages={"required": "密码不能为空", "min_length": "密码必须大于8位"})
    stu_number = forms.CharField(widget=forms.TextInput(attrs={"placeholder": "学号", "required": "required", }),
                              max_length=13,min_length=13,error_messages={"required": "学号不能为空", "min_length": "请检查您的学号为13位"})


class CommentForm(forms.Form):
    '''
    评论表单
    '''
    author = forms.CharField(widget=forms.TextInput(attrs={"id": "author", "class": "comment_input",
                                                           "required": "required","size": "25", "tabindex": "1"}),
                              max_length=50,error_messages={"required":"username不能为空",})
    email = forms.EmailField(widget=forms.TextInput(attrs={"id":"email","type":"email","class": "comment_input",
                                                           "required":"required","size":"25", "tabindex":"2"}),
                                 max_length=50, error_messages={"required":"email不能为空",})
    comment = forms.CharField(widget=forms.Textarea(attrs={"id":"comment","class": "message_input",
                                                           "required": "required", "cols": "25",
                                                           "rows": "5", "tabindex": "4"}),
                                                    error_messages={"required":"评论不能为空",})
    article = forms.CharField(widget=forms.HiddenInput())


