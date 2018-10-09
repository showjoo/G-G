# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
import django.contrib.auth.models
import django.core.validators
from django.conf import settings
import django.utils.timezone


class Migration(migrations.Migration):

    dependencies = [
        ('auth', '0006_require_contenttypes_0002'),
    ]

    operations = [
        migrations.CreateModel(
            name='User',
            fields=[
                ('id', models.AutoField(verbose_name='ID', primary_key=True, serialize=False, auto_created=True)),
                ('password', models.CharField(verbose_name='password', max_length=128)),
                ('last_login', models.DateTimeField(verbose_name='last login', blank=True, null=True)),
                ('is_superuser', models.BooleanField(verbose_name='superuser status', default=False, help_text='Designates that this user has all permissions without explicitly assigning them.')),
                ('username', models.CharField(verbose_name='username', max_length=30, unique=True, help_text='Required. 30 characters or fewer. Letters, digits and @/./+/-/_ only.', validators=[django.core.validators.RegexValidator('^[\\w.@+-]+$', 'Enter a valid username. This value may contain only letters, numbers and @/./+/-/_ characters.', 'invalid')], error_messages={'unique': 'A user with that username already exists.'})),
                ('first_name', models.CharField(verbose_name='first name', max_length=30, blank=True)),
                ('last_name', models.CharField(verbose_name='last name', max_length=30, blank=True)),
                ('email', models.EmailField(verbose_name='email address', max_length=254, blank=True)),
                ('is_staff', models.BooleanField(verbose_name='staff status', default=False, help_text='Designates whether the user can log into this admin site.')),
                ('is_active', models.BooleanField(verbose_name='active', default=True, help_text='Designates whether this user should be treated as active. Unselect this instead of deleting accounts.')),
                ('date_joined', models.DateTimeField(verbose_name='date joined', default=django.utils.timezone.now)),
                ('avatar', models.ImageField(verbose_name='用户头像', max_length=200, blank=True, null=True, default='avatar/default.png', upload_to='avatar/%Y/%m')),
                ('balance', models.FloatField(verbose_name='余额', default=0)),
                ('date_reg', models.DateTimeField(verbose_name='注册时间', auto_now_add=True)),
                ('mobile', models.CharField(verbose_name='手机', max_length=11)),
                ('address', models.CharField(verbose_name='地址', max_length=200)),
                ('post', models.CharField(verbose_name='邮编', max_length=10)),
                ('status', models.BooleanField(verbose_name='账户状态', default=False)),
                ('stu_number', models.CharField(max_length=11)),
                ('groups', models.ManyToManyField(verbose_name='groups', blank=True, help_text='The groups this user belongs to. A user will get all permissions granted to each of their groups.', related_name='user_set', related_query_name='user', to='auth.Group')),
                ('user_permissions', models.ManyToManyField(verbose_name='user permissions', blank=True, help_text='Specific permissions for this user.', related_name='user_set', related_query_name='user', to='auth.Permission')),
            ],
            options={
                'verbose_name': '用户',
                'verbose_name_plural': '用户',
                'ordering': ['-id'],
            },
            managers=[
                ('objects', django.contrib.auth.models.UserManager()),
            ],
        ),
        migrations.CreateModel(
            name='Fenlei',
            fields=[
                ('id', models.AutoField(verbose_name='ID', primary_key=True, serialize=False, auto_created=True)),
                ('title', models.CharField(verbose_name='分类名称', max_length=200)),
                ('desc', models.CharField(verbose_name='分类描述', max_length=2000)),
            ],
            options={
                'verbose_name': '商品分类',
                'verbose_name_plural': '商品分类',
            },
        ),
        migrations.CreateModel(
            name='Order',
            fields=[
                ('id', models.AutoField(verbose_name='ID', primary_key=True, serialize=False, auto_created=True)),
                ('product', models.IntegerField(verbose_name='商品编号', default=0)),
                ('time', models.DateTimeField(verbose_name='时间', auto_now_add=True)),
                ('money', models.FloatField(verbose_name='金额', default=0)),
                ('user', models.ForeignKey(verbose_name='用户', blank=True, null=True, to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'verbose_name': '订单',
                'verbose_name_plural': '订单',
            },
        ),
        migrations.CreateModel(
            name='Products',
            fields=[
                ('id', models.AutoField(verbose_name='ID', primary_key=True, serialize=False, auto_created=True)),
                ('title', models.CharField(verbose_name='名称', max_length=200)),
                ('desc', models.TextField(verbose_name='商品描述')),
                ('image', models.ImageField(verbose_name='商品图片', max_length=200, blank=True, null=True, default='default.png', upload_to='%Y/%m')),
                ('price', models.FloatField(verbose_name='价格', default=0)),
                ('stock', models.IntegerField(verbose_name='库存', default=0)),
                ('time', models.DateTimeField(verbose_name='上架时间', auto_now_add=True)),
                ('ptype', models.ForeignKey(verbose_name='类型', to='shop.Fenlei')),
            ],
            options={
                'verbose_name': '商品目录',
                'verbose_name_plural': '商品目录',
            },
        ),
        migrations.CreateModel(
            name='Shopcar',
            fields=[
                ('id', models.AutoField(verbose_name='ID', primary_key=True, serialize=False, auto_created=True)),
                ('product', models.IntegerField(verbose_name='商品编号', default=0)),
                ('money', models.FloatField(verbose_name='金额', default=0)),
                ('user', models.ForeignKey(verbose_name='用户', blank=True, null=True, to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'verbose_name': '购物车',
                'verbose_name_plural': '购物车',
            },
        ),
    ]
