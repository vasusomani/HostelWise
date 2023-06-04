from rest_framework import serializers

from .models import Student, Cleaner, SuperUser, RoomCleanData, ComplainData,MessFeedbackData


class StudentSerializer(serializers.ModelSerializer):
    class Meta:
        model = Student
        fields = ('s_SECRETKEY', 's_Name', 's_Gender', 's_Email', 's_Password', 's_Registration_Number', 's_Room_Number', 's_Block', 's_Type','s_Already_Requested_Room_clean', 'date_added')


class CleanerSerializer(serializers.ModelSerializer):
    class Meta:
        model = Cleaner
        fields = ('c_SECRETKEY','c_Name', 'c_Gender', 'c_Phone', 'c_Password', 'c_Registration_Number', 'c_Block', 's_Type','c_RoomsCleaned', 'date_added')


class SuperUserSerializer(serializers.ModelSerializer):
    class Meta:
        model = SuperUser
        fields = ('su_ID', 'su_Password', 'su_Name', 'su_Block', 's_Type', 'date_added')

class RoomCleanDataSerializer(serializers.ModelSerializer):
    student = serializers.PrimaryKeyRelatedField(queryset=Student.objects.all(), allow_null=True)
    completed = serializers.BooleanField(default=False)
    cleaner_ID = serializers.CharField(max_length=100, default="")
    date_added = serializers.DateTimeField(read_only=True)

    class Meta:
        model = RoomCleanData
        fields = ('student', 'completed', 'cleaner_ID', 'date_added', 'date_completed')

class RoomCleanDataPUT(serializers.ModelSerializer):
    completed = serializers.BooleanField(required=True)
    cleaner_ID = serializers.CharField(max_length=100)
    class Meta:
        model = RoomCleanData
        fields = ('completed', 'cleaner_ID')

class ComplainDataSerializer(serializers.ModelSerializer):
    student = serializers.PrimaryKeyRelatedField(queryset=Student.objects.all(), allow_null=True)
    completed = serializers.BooleanField(default=False)
    date_added = serializers.DateTimeField(read_only=True)

    class Meta:
        model = ComplainData
        fields = ('student','message', 'completed', 'date_added', 'date_completed')

class MaintainanceRequestSerializer(serializers.ModelSerializer):
    student = serializers.PrimaryKeyRelatedField(queryset=Student.objects.all(), allow_null=True)
    completed = serializers.BooleanField(default=False)
    date_added = serializers.DateTimeField(read_only=True)

    class Meta:
        model = ComplainData
        fields = ('student','message', 'completed', 'date_added', 'date_completed')

class MessFeedbackRequestSerializer(serializers.ModelSerializer):
    student = serializers.PrimaryKeyRelatedField(queryset=Student.objects.all(), allow_null=True)
    date_added = serializers.DateTimeField(read_only=True)

    class Meta:
        model = MessFeedbackData
        fields = ('student','message','date_added')