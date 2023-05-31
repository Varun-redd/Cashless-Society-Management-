
from django.db.models import  Count, Avg
from django.shortcuts import render, redirect
from django.db.models import Count
import datetime
from django.shortcuts import render, redirect, get_object_or_404

# Create your views here.
from Remote_User.models import fraud_model,product_model,ClientRegister_Model,review_Model,recommend_Model,purchase_Model,purchaseconfirm_Model


def serviceproviderlogin(request):
    if request.method  == "POST":
        admin = request.POST.get('username')
        password = request.POST.get('password')
        if admin == "SProvider" and password =="SProvider":
            return redirect('Add_Products')


    return render(request,'SProvider/serviceproviderlogin.html')

def Add_Products(request):

    status=''
    result = ''
    pos = []
    neg = []
    oth = []
    se = 'se'
    if request.method == "POST":
        pname = request.POST.get('pname')
        pprice = request.POST.get('pprice')
        cname = request.POST.get('cname')
        pcat = request.POST.get('pcat')
        sp = request.POST.get('sp')
        uses = request.POST.get('uses')
        cmd = request.POST.get('pdesc')

        datetime_object = datetime.datetime.now()

        if '#' in cmd:
         startingpoint = cmd.find('#')
         a = cmd[startingpoint:]
         endingPoint = a.find(' ')
         title = a[0:endingPoint]
         result = title[1:]
        # return redirect('')


         se = 'nutral'
        product_model.objects.create(names=pname ,p_desc=cmd,p_uses=uses, c_name=cname,topics=result, p_price=pprice,pcat=pcat, sanalysis=se,
                                        DT=datetime_object,senderstatus='process',sprovider=sp)
    return render(request,'SProvider/Add_Products.html', {'obj':status,'result': result, 'se': se})



def viewtreandingquestions(request,chart_type):
    dd = {}
    pos,neu,neg =0,0,0
    poss=None
    topic = product_model.objects.values('ratings').annotate(dcount=Count('ratings')).order_by('-dcount')
    for t in topic:
        topics=t['ratings']
        pos_count=product_model.objects.filter(topics=topics).values('names').annotate(topiccount=Count('ratings'))
        poss=pos_count
        for pp in pos_count:
            senti= pp['names']
            if senti == 'positive':
                pos= pp['topiccount']
            elif senti == 'negative':
                neg = pp['topiccount']
            elif senti == 'nutral':
                neu = pp['topiccount']
        dd[topics]=[pos,neg,neu]
    return render(request,'SProvider/viewtreandingquestions.html',{'object':topic,'dd':dd,'chart_type':chart_type})


def View_Remote_Users(request):
    obj=ClientRegister_Model.objects.all()
    return render(request,'SProvider/View_Remote_Users.html',{'objects':obj})

def ViewTrendings(request):
    topic = product_model.objects.values('topics').annotate(dcount=Count('topics')).order_by('-dcount')
    return  render(request,'SProvider/ViewTrendings.html',{'objects':topic})

def negativechart(request,chart_type):
    dd = {}
    pos, neu, neg = 0, 0, 0
    poss = None
    topic = product_model.objects.values('ratings').annotate(dcount=Count('ratings')).order_by('-dcount')
    for t in topic:
        topics = t['ratings']
        pos_count = product_model.objects.filter(topics=topics).values('names').annotate(topiccount=Count('ratings'))
        poss = pos_count
        for pp in pos_count:
            senti = pp['names']
            if senti == 'positive':
                pos = pp['topiccount']
            elif senti == 'negative':
                neg = pp['topiccount']
            elif senti == 'nutral':
                neu = pp['topiccount']
        dd[topics] = [pos, neg, neu]
    return render(request,'SProvider/negativechart.html',{'object':topic,'dd':dd,'chart_type':chart_type})


def charts(request,chart_type):
    chart1 = product_model.objects.values('names').annotate(dcount=Avg('ratings'))
    return render(request,"SProvider/charts.html", {'form':chart1, 'chart_type':chart_type})

def dislikeschart(request,dislike_chart):
    charts = product_model.objects.values('names').annotate(dcount=Avg('dislikes'))
    return render(request,"SProvider/dislikeschart.html", {'form':charts, 'dislike_chart':dislike_chart})

def likeschart(request,like_chart):
    charts = product_model.objects.values('names').annotate(dcount=Avg('likes'))
    return render(request,"SProvider/likeschart.html", {'form':charts, 'like_chart':like_chart})

def View_Products_Details(request):
    obj = product_model.objects.all()
    return render(request, 'SProvider/View_Products_Details.html', {'list_objects': obj})

def viewallpostsreviews(request):

        obj = review_Model.objects.all()

        return render(request, 'SProvider/Viewallpostsreviews.html', {'list_objects': obj})

def View_Recommended_Products(request):
    obj = recommend_Model.objects.all()

    return render(request, 'SProvider/View_Recommended_Products.html', {'list_objects': obj})

def View_Purchased_Details(request):
    pur='Delivered'
    obj = purchase_Model.objects.filter(pstatus=pur)
    return render(request, 'SProvider/View_Purchased_Details.html', {'list_objects': obj})

def View_CreditCard_Frauds(request):

    obj = fraud_model.objects.all()
    return render(request, 'SProvider/View_CreditCard_Frauds.html', {'list_objects': obj})

def View_Purchased_Status(request):
    pur='Pending'
    obj = purchase_Model.objects.filter(pstatus=pur)

    return render(request, 'SProvider/View_Purchased_Status.html', {'list_objects': obj})

def confirmstatus(request,pk):

    objs = purchase_Model.objects.get(id=pk)
    uname = objs.uname
    pname = objs.pname
    pprice = objs.price
    addr = objs.addr


    datetime_object = datetime.datetime.now()

    if request.method == "POST":
        uname = request.POST.get('uname')
        pname = request.POST.get('pname')
        pprice1 = request.POST.get('pprice')
        addr = request.POST.get('addr')
        daddr = request.POST.get('daddr')
        datetime_object = datetime.datetime.now()

        if addr==daddr:
            pst1='Delivered'
            obj = get_object_or_404(purchase_Model, id=pk)
            obj.pstatus = pst1
            obj.save(update_fields=["pstatus"])
        elif addr!=daddr:
          pst1 = 'Fraud Seller'
          obj = get_object_or_404(purchase_Model, id=pk)
          obj.pstatus = pst1
          obj.save(update_fields=["pstatus"])

        purchaseconfirm_Model.objects.create(uname=uname,pname=pname,price=pprice1,dt=datetime_object,addr=addr,daddr=daddr,dtype=pst1)
    return render(request,'SProvider/confirmstatus.html',{'objc':uname,'objc1':pname,'pprice':pprice,'addr':addr})










