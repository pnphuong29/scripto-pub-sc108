import ipdb
from datetime import datetime, date, time, timedelta
import sys
import os
from importlib import import_module
from pathlib import Path
import pprint
import json
import logging
from xml.dom import minidom
from xml.dom.minidom import parseString, parse, Element, Node, Document
# import graphene
from faker import Faker

# from lib1.django.admin.common import *
# from lib1.django.cmd.common import *
# from lib1.django.db.common import *
# from lib1.django.db.location import *
# from lib1.django.forms.common import *
# from lib1.django.serializers.common import *
# from lib1.django.utils.common import *

print(f"Current dir = [{Path.cwd()}]")
# if os.path.isfile("manage.py"):
#     import_module("Form", "django.forms")
#     import_module("ModelForm", "django.forms")
#     import_module("formset_factory", "django.forms")
#     import_module("modelformset_factory", "django.forms")
#     import_module("modelform_factory", "django.forms")
    
#     import_module("ModelSerializer", "rest_framework.serializers")
#     import_module("JSONRenderer", "rest_framework.renderers")
#     import_module("JSONParser", "rest_framework.parsers")
    
#     import_module("DjangoObjectType", "graphene_django")
#     import_module("settings", "django.conf")
#     import_module("mixer", "mixer.backend.django")

pp=pprint.PrettyPrinter(indent=4)
pp=pp.pprint

DOMImpl=minidom.getDOMImplementation()
xmldoc=DOMImpl.createDocument(None, "div", None)
doc_root=xmldoc.documentElement

print("Hello Albert")
