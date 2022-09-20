# TODO: Make ability to read task only for observer/executor/author

from rest_framework import permissions


class ChangeByAuthorOnly(permissions.BasePermission):  # TODO: Rename permission

    def has_permission(self, request, view):
        if request.user.is_authenticated:
            return True
        return False

    def has_object_permission(self, request, view, obj):
        if obj.author == request.user:
            return True
        return False