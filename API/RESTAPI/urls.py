from django.urls import path
from . import views

urlpatterns = [
    path('studentregister/', views.STUDENTREGISTER),
    path('generallogin/',views.GENERALLOGIN),
    path('dashboard/<str:api_key>/<str:action>/',views.GENERALDASHBOARD)

]