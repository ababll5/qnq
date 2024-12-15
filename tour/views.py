# coding:utf-8
from django.views.decorators.csrf import csrf_exempt
from django.shortcuts import render, redirect,HttpResponse
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from django.db.models import Q
# from .algorithm import addr, ItemCF, UserCF
from .models import *
import random
import json



def init(request):
    if request.method == 'GET':
        # 热门推荐 按评分排序 根据位置定位 省份
        # ip, address = addr.ip_info()  # 根据访问的IP定位位置
        hot = View.objects.order_by('view_rate')[::-1]

        # 随机推荐
        rand = View.objects.order_by('?')[:10]
        rec=rand[4]
        rec1=rand[5]
        rec2=rand[6]
        # 猜你喜欢
        guess = View.objects.order_by('?')[:10]
        data = {
            'hot': hot,
            'randrec': rand[:3],
            'guess': guess,
            'rec':rec,
            'rec1':rec1,
            'rec2':rec2,
        }

        return render(request, 'index.html', data)


def articles(request):#全部攻略总页面
    res = Article.objects.all()
    return render(request, 'articles.html',{'res':res})


def look(request):#单篇攻略详情
    view_id = request.GET.get('id', False)
    res = Article.objects.get(id=view_id)
    return render(request, 'article.html',{'res':res})


def live(request):#酒店详情
    hid = request.GET.get('id', False)
    h = Hotel.objects.get(id=hid)
    return render(request, 'live.html',{'h':h})


@login_required
def orders(request):
    hid = request.POST.get('hid', False)
    date = request.POST.get('date', False)
    num = request.POST.get('num', False)
    h=Hotel.objects.get(id=int(hid))
    Order.objects.create(hotel=h, date=date,user= request.user,num=int(num),price=int(num)*h.price  )
    return HttpResponse('恭喜您预订成功！')

@login_required
def my(request):#订单
    res=Order.objects.filter(user=request.user  )
    return render(request, 'order.html',locals())


def hotels(request):#全部酒店
    res = Hotel.objects.all()
    return render(request, 'hotels.html',{'res':res})

@csrf_exempt
# @login_required(login_url='/login')
def detail(request):#景点详情
    if request.method == 'GET':
        view_id = request.GET.get('id', False)
        view = View.objects.filter(id=view_id).first()

        # 类似推荐
        sim = View.objects.filter(city=view.city)

        # 该景点的评论
        comments = Comment.objects.filter(view=view).order_by('comment_date')[::-1]

        # 评分统计
        score = Score.objects.filter(view=view)
        pn = len(score)
        rate = round(sum(int(s.rate) for s in score) * 1.0 / pn, 1) if pn else 0.0

        # collection = Collection.objects.filter(view=view, user=request.user)

        data = {
            'view': view,
            'sim': sim,
            'comments': comments,
            'pn': pn,
            'rate': rate,
            # 'collection': collection
        }
        return render(request, 'detail.html', data)

    elif request.method == 'POST':
        if not request.user.username:
            msg = {
            'msg': u'请先登录再进行操作！',
            'type': 'danger'
            }
            return  HttpResponse(json.dumps(msg), content_type='application/json')
        comment = request.POST.get('text', False)
        view_id = request.POST.get('id', False)
        score = request.POST.get('score', False)
        collection = request.POST.get('collection', False)

        view = View.objects.get(id=view_id)

        msg = {
            'msg': u'发生未知错误',
            'type': 'danger'
        }
        if comment:
            Comment.objects.create(user=request.user, view=view, comment=comment)
            msg['msg'] = u'评论提交成功，页面即将刷新!'
            msg['type'] = 'success'

            return HttpResponse(json.dumps(msg), content_type='application/json')

        if score:
            score = int(score)
            s = Score.objects.filter(user=request.user, view=view)
            if s:
                s[0].rate = score
                s[0].save()
            else:
                Score.objects.create(user=request.user, view=view, rate=score)
            msg['msg'] = u'感谢您的评分!'
            msg['type'] = 'success'
            return HttpResponse(json.dumps(msg), content_type='application/json')

        if collection:
            if collection == 'collection-true':
                Collection.objects.create(user=request.user, view=view)
                msg['msg'] = u'收藏成功!'

            elif collection == 'collection-false':
                Collection.objects.filter(user=request.user, view=view).delete()
                msg['msg'] = u'已取消收藏!'

            msg['type'] = 'success'
            return HttpResponse(json.dumps(msg), content_type='application/json')

        return HttpResponse(json.dumps(msg), content_type='application/json')


@csrf_exempt
def sign_in(request):
    if request.method == 'POST':
        username = request.POST.get('username', False)
        pw = request.POST.get('pw', False)
        user = authenticate(username=username, password=pw)
        if user:
            login(request, user)
            return redirect('/')

    if request.method == 'GET':
        username = request.GET.get('username', False)
        pw = request.GET.get('pw', False)
        if not username or not pw:
            return render(request, 'login.html')
        user = authenticate(username=username, password=pw)
        msg = {
            'msg': u'登录成功，页面正在跳转！',
            'type': 'success'
        }
        if not user:
            msg['msg'] = u'账号或密码错误,请检查后重新登录!'
            msg['type'] = 'danger'
        return HttpResponse(json.dumps(msg), content_type='application/json')


@csrf_exempt
def register(request):
    if request.method == 'POST':
        username = request.POST.get('username', False)
        pw = request.POST.get('pw', False)
        email = request.POST.get('email', False)

        # 生成随机编号
        number = random.randint(1000000, 9999999)
        if not ExtUser.objects.filter(number=number):
            user = User.objects.create_user(username=username, password=pw, email=email)
            ExtUser.objects.create(user=user, number=number)
            user = authenticate(username=username, password=pw)
            login(request, user)
            return redirect('/')

    elif request.method == 'GET':
        username = request.GET.get('username', False)
        pw = request.GET.get('pw', False)
        rpw = request.GET.get('rpw', False)
        if not username or not pw:
            return render(request, 'register.html')
        msg = {
            'msg': u'账号注册成功!',
            'type': 'success'
        }
        if not pw.isalnum():
            msg['msg'] = u'密码只能由数字字母组成！'
            msg['type'] = 'danger'
        if pw != rpw:
            msg['msg'] = u'两次输入的密码不一致！'
            msg['type'] = 'danger'
        if len(pw) < 6:
            msg['msg'] = u'密码至少需要6个字符！'
            msg['type'] = 'danger'
        if User.objects.filter(username=username):
            msg['msg'] = u'用户名已经存在！'
            msg['type'] = 'danger'

        return HttpResponse(json.dumps(msg), content_type='application/json')


def sign_out(request):
    logout(request)
    return redirect('/')


def search(request):
    if request.method == 'GET':
        word = request.GET.get('word', False)
        views = View.objects.filter(Q(province__contains=word) | Q(view_name__contains=word) | Q(city__contains=word))

        for v in views:
            score = Score.objects.filter(view=v)
            v.view_rate = sum(s.rate for s in score)*1.0/len(score) if score else 0

        return render(request, 'search.html', {'views': views})



@login_required(login_url='/login')
def publish(request):
    if request.method == 'GET':
        return render(request, 'collection.html')
    else:
        Article.objects.create(author=request.user,title=request.POST.get('title'),content=request.POST.get('content')  )
        return HttpResponse('发布成功！')


@login_required(login_url='/login')
@csrf_exempt
def info(request):
    user = request.user
    try:
        extuser = user.extuser
    except ExtUser.DoesNotExist:
        extuser = ExtUser.objects.create(user=user)

    if request.method == 'GET':
        return render(request, 'info.html')
    elif request.method == 'POST':
        username = request.POST.get('username', False)
        password = request.POST.get('password', False)
        sex = request.POST.get('sex', False)
        age = request.POST.get('age', False)
        phone = request.POST.get('phone', False)
        address = request.POST.get('address', False)

        # 检查用户名是否唯一，感觉没必要，但还是写一下，不知道啥时候会出这个错
        if username and User.objects.filter(username=username).exclude(pk=user.pk).exists():
            # 用户名已存在，返回错误信息或提示用户选择其他用户名
            return render(request, 'info.html', {'error': '用户名已存在'})

        #user.username = username 不能写，会违反唯一性约束，相当于新建了一个重名的临时变量
        if password:
            user.set_password(password)
        user.save()
        user.extuser.sex = sex
        user.extuser.age = age
        user.extuser.phone = phone
        user.extuser.address = address
        user.extuser.save()

        return redirect('/info')
    
def food_init(request):
    if request.method == 'GET':
        # 热门推荐 按评分排序
        hot = Food.objects.order_by('-food_rate')
        # 随机推荐
        rand = Food.objects.order_by('?')[:10]
        rec=rand[4]
        rec1=rand[5]
        rec2=rand[6]
        # 猜你喜欢,纯猜，没算法
        guess = Food.objects.order_by('?')[:10]
        data = {
            'hot': hot,
            'randrec': rand[:3],
            'guess': guess,
            'rec':rec,
            'rec1':rec1,
            'rec2':rec2,
        }
        return render(request, 'food_init.html', data)
    
def food_detail(request):#美食详情
    if request.method == 'GET':
        food_id = request.GET.get('id', False)
        food = Food.objects.filter(food_id=food_id).first()

        # 类似推荐
        sim = Food.objects.filter(f_province=food.f_province)

        # 该美食的评论
        comments = Food_Comment.objects.filter(food=food).order_by('comment_date')[::-1]

        # 评分统计
        score = Rating.objects.filter(food=food)
        pn = len(score)
        rate = round(sum(int(s.rate) for s in score) * 1.0 / pn, 1) if pn else 0.0

        # collection = Collection.objects.filter(view=view, user=request.user)

        data = {
            'food': food,
            'sim': sim,
            'comments': comments,
            'pn': pn,
            'rate': rate,
            # 'collection': collection
        }
        return render(request, 'food_detail.html', data)

    elif request.method == 'POST':
        if not request.user.username:
            msg = {
            'msg': u'请先登录再进行操作！',
            'type': 'danger'
            }
            return  HttpResponse(json.dumps(msg), content_type='application/json')
        comment = request.POST.get('text', False)
        food_id = request.POST.get('food_id', False)
        score = request.POST.get('score', False)
        collection = request.POST.get('collection', False)

        food = Food.objects.get(food_id=food_id)

        msg = {
            'msg': u'发生未知错误',
            'type': 'danger'
        }
        if comment:
            Food_Comment.objects.create(user=request.user, food=food, comment=comment)
            msg['msg'] = u'评论提交成功，页面即将刷新!'
            msg['type'] = 'success'

            return HttpResponse(json.dumps(msg), content_type='application/json')

        if score:
            score = int(score)
            s = Rating.objects.filter(user=request.user, food=food)
            if s:
                s[0].rate = score
                s[0].save()
            else:
                Rating.objects.create(user=request.user, food=food, rate=score)
            msg['msg'] = u'感谢您的评分!'
            msg['type'] = 'success'
            return HttpResponse(json.dumps(msg), content_type='application/json')

        if collection:
            if collection == 'collection-true':
                Collection.objects.create(user=request.user, food=food)
                msg['msg'] = u'收藏成功!'

            elif collection == 'collection-false':
                Collection.objects.filter(user=request.user, food=food).delete()
                msg['msg'] = u'已取消收藏!'
        
            msg['type'] = 'success'
            return HttpResponse(json.dumps(msg), content_type='application/json')

        return HttpResponse(json.dumps(msg), content_type='application/json')

    
def food_search(request):
    if request.method == 'GET':
        word = request.GET.get('word', False)
        foods = Food.objects.filter(Q(food_name__contains=word) | Q(food_desc__contains=word) | Q(f_province__contains=word)| Q(f_city__contains=word))

        for f in foods:
            ratings = Rating.objects.filter(food=f)
            f.avg_rating = sum(r.rating for r in ratings) / len(ratings) if ratings else 0

        return render(request, 'food_search.html', {'foods': foods})







