from django.contrib import admin
from .models import Student,Cleaner,SuperUser, RoomCleanData, ComplainData, MaintainanceRequestData, MessFeedbackData
# Register your models here.


admin.site.register(Student)
admin.site.register(Cleaner)
                    

class StudentAdmin(admin.ModelAdmin):
    list_display = ['s_Name', 's_Registration_Number', 's_Block']
    list_filter = ['s_Block', 's_Name']
    search_fields = ['s_Name', 's_Registration_Number']


class CleanerAdmin(admin.ModelAdmin):
    list_display = ['c_Name', 'c_Registration_Number', 'c_Block']
    list_filter = ['c_Block']
    search_fields = ['c_Name', 'c_Registration_Number']


class SuperUserAdmin(admin.ModelAdmin):
    list_display = ('su_Name', 'su_ID', 'su_SECRETKEY', 'su_Password', 'su_Block', 'su_Type', 'date_added')
    readonly_fields = ('su_SECRETKEY', 'date_added')

admin.site.register(SuperUser, SuperUserAdmin)

class RoomCleanDataAdmin(admin.ModelAdmin):
    list_display = ['student', 'completed', 'cleaner_ID', 'date_added', 'date_completed']
    list_filter = ['completed']
    search_fields = ['student__s_Name']
    readonly_fields = ['date_added', 'date_completed'] 

admin.site.register(RoomCleanData, RoomCleanDataAdmin)

class ComplainDataAdmin(admin.ModelAdmin):
    list_display = ('student', 'message', 'completed', 'date_added', 'date_completed')
    list_filter = ('completed',)
    search_fields = ('student__name', 'message')
    readonly_fields = ('date_added', 'date_completed')

admin.site.register(ComplainData, ComplainDataAdmin)

class MaintainanceRequestDataAdmin(admin.ModelAdmin):
    list_display = ('student', 'message', 'completed', 'date_added', 'date_completed')
    list_filter = ('completed',)
    search_fields = ('student__name', 'message')
    readonly_fields = ('date_added', 'date_completed')

admin.site.register(MaintainanceRequestData, MaintainanceRequestDataAdmin)


class MessFeedbackDataAdmin(admin.ModelAdmin):
    list_display = ('student', 'message', 'date_added')
    list_filter = ('date_added',)
    search_fields = ('student__name', 'message')
    readonly_fields = ('date_added',)

admin.site.register(MessFeedbackData,MessFeedbackDataAdmin)

