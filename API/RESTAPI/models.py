from typing_extensions import Required
from django.utils import timezone
from enum import auto
from django.db import models
import random
import string

def generate_auto_generated_field_value():
    return ''.join(random.choice(string.ascii_letters) for _ in range(25))


class Student(models.Model):
    s_SECRETKEY = models.CharField(max_length=25,primary_key=True,unique=True,default=generate_auto_generated_field_value)
    s_Name = models.CharField(max_length=100)
    s_Gender = models.CharField(max_length=10)
    s_Email = models.CharField(max_length=100,unique=True)
    s_Password = models.CharField(max_length=100)
    s_Registration_Number = models.CharField(max_length=10, unique=True)
    s_Room_Number = models.CharField(max_length=10)
    s_Block = models.CharField(max_length=1)
    s_Type = models.CharField(max_length=10,default='STUDENT')
    s_Already_Requested_Room_clean = models.BooleanField(default=False)
    date_added = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f'{self.s_Name} : {self.s_Registration_Number}'
    
class Cleaner(models.Model):
    c_SECRETKEY = models.CharField(max_length=25,unique=True,default=generate_auto_generated_field_value)
    c_Name = models.CharField(max_length=100)
    c_Gender = models.CharField(max_length=10)
    c_Phone = models.CharField(max_length=10,unique=True)
    c_Password = models.CharField(max_length=100,default='defaultpw')
    c_Registration_Number = models.CharField(max_length=10, unique=True, primary_key=True)
    c_Block = models.CharField(max_length=1)
    c_Type = models.CharField(max_length=10,default='CLEANER')
    c_RoomsCleaned =models.IntegerField(default=0)
    date_added = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f'{self.c_Name} : {self.c_Block}'
    
class SuperUser(models.Model):
    su_SECRETKEY = models.CharField(max_length=50,unique=True,default=generate_auto_generated_field_value)
    su_ID=models.CharField(max_length=100,primary_key=True,unique=True)
    su_Password=models.CharField(max_length=100)
    su_Name=models.CharField(max_length=100)
    su_Block=models.CharField(max_length=10)
    su_Type = models.CharField(max_length=10,default='SUPERUSER')
    date_added = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f'{self.su_Name} : {self.su_ID}'

class RoomCleanData(models.Model):
    student = models.ForeignKey('Student', on_delete=models.CASCADE,blank=True)
    completed = models.BooleanField(default=False)
    cleaner_ID = models.CharField(max_length=100,default="")
    date_added = models.DateTimeField(auto_now_add=True)
    date_completed = models.CharField(blank=True,max_length=100,null=True)

    def save(self, *args, **kwargs):
        if self.completed and not self.date_completed:
            self.date_completed = timezone.now().strftime('%B %d, %Y, %I:%M %p')
        super().save(*args, **kwargs)

class ComplainData(models.Model):
    student = models.ForeignKey('Student', on_delete=models.CASCADE,blank=True)
    message=models.CharField(max_length=5000)
    completed = models.BooleanField(default=False)
    date_added = models.DateTimeField(auto_now_add=True)
    date_completed = models.CharField(blank=True,max_length=100,null=True)

    def save(self, *args, **kwargs):
        if self.completed and not self.date_completed:
            self.date_completed = timezone.now().strftime('%B %d, %Y, %I:%M %p')
        super().save(*args, **kwargs)

class MaintainanceRequestData(models.Model):
    student = models.ForeignKey('Student', on_delete=models.CASCADE,blank=True)
    message=models.CharField(max_length=5000)
    completed = models.BooleanField(default=False)
    date_added = models.DateTimeField(auto_now_add=True)
    date_completed = models.CharField(blank=True,max_length=100,null=True)

    def save(self, *args, **kwargs):
        if self.completed and not self.date_completed:
            self.date_completed = timezone.now().strftime('%B %d, %Y, %I:%M %p')
        super().save(*args, **kwargs)

class MessFeedbackData(models.Model):
    student = models.ForeignKey('Student', on_delete=models.CASCADE,blank=True)
    message=models.CharField(max_length=5000)
    date_added = models.DateTimeField(auto_now_add=True)


