"""cashless URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.conf.urls import url
from django.contrib import admin
from Remote_User import views as remoteuser
from cashless import settings
from Service_Provider import views as serviceprovider
from django.conf.urls.static import static


urlpatterns = [
    url('admin/', admin.site.urls),

    url(r'^$', remoteuser.login, name="login"),


    url(r'^Register1/$', remoteuser.Register1, name="Register1"),

    url(r'^Recommend/(?P<pk>\d+)/$', remoteuser.Recommend, name="Recommend"),
    url(r'^Review/(?P<pk>\d+)/$', remoteuser.Review, name="Review"),
    url(r'^Search_Products/$', remoteuser.Search_Products, name="Search_Products"),
    url(r'^View_All_Product_Details/$', remoteuser.View_All_Product_Details, name="View_All_Product_Details"),
    url(r'^View_Product_Reviews/$', remoteuser.View_Product_Reviews, name="View_Product_Reviews"),
    url(r'^ratings/(?P<pk>\d+)/$', remoteuser.ratings, name="ratings"),
    url(r'^dislikes/(?P<pk>\d+)/$', remoteuser.dislikes, name="dislikes"),
    url(r'^likes/(?P<pk>\d+)/$', remoteuser.likes, name="likes"),
    url(r'ViewTrending/$', remoteuser.ViewTrending, name="ViewTrending"),
    url(r'^ViewYourProfile/$', remoteuser.ViewYourProfile, name="ViewYourProfile"),
    url(r'^purchase/(?P<pk>\d+)/$', remoteuser.purchase, name="purchase"),
    url(r'^View_Product_Recommends/$', remoteuser.View_Product_Recommends, name="View_Product_Recommends"),
    url(r'^View_All_Collusion_Sellers/$', remoteuser.View_All_Collusion_Sellers, name="View_All_Collusion_Sellers"),
    url(r'^View_Account_Details/$', remoteuser.View_Account_Details, name="View_Account_Details"),


    url(r'^Add_Products/$', serviceprovider.Add_Products, name="Add_Products"),
    url(r'^serviceproviderlogin/$',serviceprovider.serviceproviderlogin, name="serviceproviderlogin"),
    url(r'View_Remote_Users/$',serviceprovider.View_Remote_Users,name="View_Remote_Users"),
    url(r'ViewTrendings/$',serviceprovider.ViewTrendings,name="ViewTrendings"),
    url(r'^charts/(?P<chart_type>\w+)', serviceprovider.charts,name="charts"),
    url(r'^dislikeschart/(?P<dislike_chart>\w+)', serviceprovider.dislikeschart,name="dislikeschart"),
    url(r'^confirmstatus/(?P<pk>\d+)/$', serviceprovider.confirmstatus,name='confirmstatus'),
    url(r'^likeschart/(?P<like_chart>\w+)', serviceprovider.likeschart,name="likeschart"),
    url(r'^View_Products_Details/$',serviceprovider.View_Products_Details, name='View_Products_Details'),
    url(r'^viewallpostsreviews/$', serviceprovider.viewallpostsreviews, name='viewallpostsreviews'),
    url(r'^View_Recommended_Products/$', serviceprovider.View_Recommended_Products, name='View_Recommended_Products'),
    url(r'^View_Purchased_Details/$', serviceprovider.View_Purchased_Details, name='View_Purchased_Details'),
    url(r'^View_Purchased_Status/$', serviceprovider.View_Purchased_Status, name='View_Purchased_Status'),
    url(r'^View_CreditCard_Frauds/$', serviceprovider.View_CreditCard_Frauds, name='View_CreditCard_Frauds'),


]+ static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)

