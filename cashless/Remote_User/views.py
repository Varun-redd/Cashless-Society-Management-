from django.db.models import Count
from django.shortcuts import render, redirect, get_object_or_404
import datetime
from random import seed
from random import randint
from django.db.models import Q


# Create your views here.
from Remote_User.models import fraud_model,account_model,review_Model,ClientRegister_Model,product_model,recommend_Model,purchase_Model,purchaseconfirm_Model


def login(request):


    if request.method == "POST" and 'submit1' in request.POST:

        username = request.POST.get('username')
        password = request.POST.get('password')
        try:

            enter = ClientRegister_Model.objects.get(username=username, password=password)
            request.session["userid"] = enter.id
            return redirect('Search_Products')
        except:
            pass

    return render(request,'RUser/login.html')



def Register1(request):

    if request.method == "POST":
        username = request.POST.get('username')
        email = request.POST.get('email')
        password = request.POST.get('password')
        phoneno = request.POST.get('phoneno')
        country = request.POST.get('country')
        state = request.POST.get('state')
        city = request.POST.get('city')

        seed(1)
        acno = randint(100000, 1000000000)
        climit = randint(100000, 1000000)

        cvv = randint(1000, 3000)

        address=country+state+city
        bname='SBI'
        account_model.objects.create(Acname=username,Acaddress=address,Acno=acno, climit=climit, alimit=climit,Bname=bname,cvv=cvv)
        ClientRegister_Model.objects.create(username=username, email=email, password=password, phoneno=phoneno,
                                            country=country, state=state, city=city)
        return render(request, 'RUser/Register1.html')
    else:

        return render(request,'RUser/Register1.html')


def ViewYourProfile(request):
    userid = request.session['userid']
    obj = ClientRegister_Model.objects.get(id= userid)
    return render(request,'RUser/ViewYourProfile.html',{'object':obj})

def Review(request,pk):
    userid = request.session['userid']
    userObj = ClientRegister_Model.objects.get(id=userid)
    username = userObj.username

    objs = product_model.objects.get(id=pk)
    tname = objs.names

    datetime_object = datetime.datetime.now()

    result = ''
    pos = []
    neg = []
    oth = []
    se = 'se'
    if request.method == "POST":
        uname = request.POST.get('uname')
        pname = request.POST.get('tname')
        feedback = request.POST.get('used')
        cmd = request.POST.get('review')

        if '#' in cmd:
            startingpoint = cmd.find('#')
            a = cmd[startingpoint:]
            endingPoint = a.find(' ')
            title = a[0:endingPoint]
            result = title[1:]
        # return redirect('')

        for f in cmd.split():
            if f in ('good', 'nice', 'better', 'best', 'excellent', 'extraordinary','beautiful', 'happy', 'won', 'love', 'greate',):
                pos.append(f)
            elif f in ('worst', 'waste', 'poor', 'error', 'imporve', 'bad', 'ridicules'):
                neg.append(f)
            else:
                oth.append(f)
        if len(pos) > len(neg):
            se = 'positive'
        elif len(neg) > len(pos):
            se = 'negative'
        else:
            se = 'neutral'
        review_Model.objects.create(uname=uname , ureview=cmd,sanalysis=se,dt=datetime_object,tname=pname ,feedback=feedback)

    return render(request,'RUser/Review.html', {'objc':username,'objc1':tname,'result': result, 'se': se})

def Recommend(request,pk):
    userid = request.session['userid']
    userObj = ClientRegister_Model.objects.get(id=userid)
    username = userObj.username

    objs = product_model.objects.get(id=pk)
    appname = objs.names

    if request.method == "POST":
        username1 = request.POST.get('uname')
        pname = request.POST.get('pname')
        loc = request.POST.get('loc')
        usefull = request.POST.get('usefull')

        datetime_object = datetime.datetime.now()
        vott1, vott, neg = 0, 0, 0
        objs = product_model.objects.get(id=pk)
        unid = objs.id
        vot_count = product_model.objects.all().filter(id=unid)
        for t in vot_count:
            vott = t.likes
            vott1 = vott + 1
            obj = get_object_or_404(product_model, id=unid)
            obj.likes = vott1
            obj.save(update_fields=["likes"])

        recommend_Model.objects.create( usefull=usefull, uname1=username1,loc=loc, dt=datetime_object, pname=pname)

    return render(request,'RUser/Recommend.html', {'objc':username,'objc1':appname})


def View_All_Product_Details(request):
    userid = request.session['userid']
    obj = product_model.objects.all()

    return render(request,'RUser/View_All_Product_Details.html',{'list_objects': obj})

def View_Product_Reviews(request):

    obj = review_Model.objects.all()

    return render(request,'RUser/View_Product_Reviews.html',{'list_objects': obj})

def ratings(request,pk):
    userid = request.session['userid']
    userObj = ClientRegister_Model.objects.get(id=userid)
    username = userObj.username
    ucity = userObj.city

    objs = product_model.objects.get(id=pk)
    tname = objs.names
    fcity = objs.c_name
    rate=''

    datetime_object = datetime.datetime.now()
    vott1, vott, neg = 0, 0, 0
    if request.method == "POST":
        uname = request.POST.get('uname')
        fname = request.POST.get('fname')
        rate = request.POST.get('rate')
        fc = request.POST.get('fc')
        yc = request.POST.get('yc')
        rate1 = int(rate)

        datetime_object = datetime.datetime.now()
        objs = product_model.objects.get(id=pk)
        unid = objs.id
        vot_count = product_model.objects.all().filter(id=unid)
        for t in vot_count:
            vott = t.ratings
            vott1 = vott + rate1
            obj = get_object_or_404(product_model, id=unid)
            obj.ratings = vott1
            obj.save(update_fields=["ratings"])

    return render(request,'RUser/ratings.html',{'objc':username,'objc1':tname,'ucity':ucity,'rate':rate,'fcity':fcity})

def purchase(request,pk):
    userid = request.session['userid']
    userObj = ClientRegister_Model.objects.get(id=userid)
    username = userObj.username
    ucity = userObj.city

    objs = product_model.objects.get(id=pk)
    tname = objs.names
    fcity = objs.c_name
    pprice = objs.p_price
    rate=''
    fraud='No Fraud'
    tprice=0
    datetime_object = datetime.datetime.now()
    vott1, vott, neg = 0, 0, 0
    if request.method == "POST":
        uname = request.POST.get('uname')
        pname = request.POST.get('pname')
        pprice1 = request.POST.get('pprice')
        addr = request.POST.get('addr')
        yc = request.POST.get('yc')
        cvv1 = request.POST.get('cvv')
        datetime_object = datetime.datetime.now()
        pst1='Pending'

        objs = account_model.objects.get(Acname=uname)
        acno = objs.Acno
        alimit=objs.alimit
        cvv=objs.cvv
        acname=objs.Acname
        acaddres=objs.Acaddress

        alimit1=int(alimit)
        price=int(pprice1)


        if alimit1<price:
            fraud='No Cash'
            pst1='No Cash'
            fraud_model.objects.create(Acname=acname, Acaddress=acaddres, Acno=acno, dt=datetime_object, ftype=fraud,pname=pname)
            purchase_Model.objects.create(uname=uname, pname=pname, price=pprice1, dt=datetime_object, addr=addr, yc=yc,
                                          pstatus=pst1)
        elif cvv != cvv1:
            fraud='Wrong CVV'
            pst1='Wrong CVV'
            fraud_model.objects.create(Acname=acname, Acaddress=acaddres, Acno=acno, dt=datetime_object, ftype=fraud,pname=pname)
            purchase_Model.objects.create(uname=uname, pname=pname, price=pprice1, dt=datetime_object, addr=addr, yc=yc,
                                          pstatus=pst1)
        elif alimit1>price and cvv == cvv1:
            tprice=alimit1-price
            obj = get_object_or_404(account_model, Acname=uname)
            obj.alimit = tprice
            obj.save(update_fields=["alimit"])
            purchase_Model.objects.create(uname=uname,pname=pname,price=pprice1,dt=datetime_object,addr=addr,yc=yc,pstatus=pst1)
        else:
            se = 'neutral'

    return render(request,'RUser/purchase.html',{'objc':username,'objc1':tname,'ucity':ucity,'rate':tname,'pprice':pprice,'fraud':fraud})



def dislikes(request,pk):
    vott1, vott, neg = 0, 0, 0
    objs = product_model.objects.get(id=pk)
    unid = objs.id
    vot_count = product_model.objects.all().filter(id=unid)
    for t in vot_count:
        vott = t.dislikes
        vott1 = vott - 1
        obj = get_object_or_404(product_model, id=unid)
        obj.dislikes = vott1
        obj.save(update_fields=["dislikes"])
        return redirect('Search_Products')
    return render(request,'RUser/dislikes.html',{'objs':vott1})

def ViewTrending(request):
    topic = product_model.objects.values('topics').annotate(dcount=Count('topics')).order_by('-dcount')
    return render(request, 'RUser/ViewTrending.html', {'objects': topic})

def View_Product_Recommends(request):
    obj = recommend_Model.objects.all()
    return render(request, 'RUser/View_Product_Recommends.html', {'list_objects': obj})

def likes(request,pk):
    vott1, vott, neg = 0, 0, 0
    objs = product_model.objects.get(id=pk)
    unid = objs.id
    vot_count = product_model.objects.all().filter(id=unid)
    for t in vot_count:
        vott = t.likes
        vott1 = vott + 1
        obj = get_object_or_404(product_model, id=unid)
        obj.likes = vott1
        obj.save(update_fields=["likes"])
        return redirect('Search_Products')

    return render(request,'RUser/likes.html',{'objs':vott1})

def Search_Products(request):

    if request.method == "POST":
          kword = request.POST.get('keyword')
          obj = product_model.objects.all().filter(Q(names__contains=kword) | Q(p_desc__contains=kword))
          return render(request, 'RUser/Search_Products.html', {'objs': obj})
    return render(request,'RUser/Search_Products.html')

def View_All_Product_Details(request):
    userid = request.session['userid']
    obj = product_model.objects.all()
    return render(request,'RUser/View_All_Product_Details.html',{'list_objects': obj})


def View_All_Collusion_Sellers(request):
    userid = request.session['userid']
    userObj = ClientRegister_Model.objects.get(id=userid)
    username = userObj.username
    dtype='Fraud Seller'
    obj = purchaseconfirm_Model.objects.filter(dtype=dtype,uname=username)
    return render(request, 'RUser/View_All_Collusion_Sellers.html', {'list_objects': obj})


def View_Account_Details(request):
    userid = request.session['userid']
    userObj = ClientRegister_Model.objects.get(id=userid)
    username = userObj.username
    obj = account_model.objects.filter(Acname=username)
    return render(request, 'RUser/View_Account_Details.html', {'list_objects': obj})
