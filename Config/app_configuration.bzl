DEFAULT_APP_NAME="SampleApp"

def appConfig():
    return {
        "appName": "MyAppBuck",
        "buildNumber": "1",
    }

def app_name():
    name = native.read_config("custom", "appName")
    if name == None:
        return DEFAULT_APP_NAME
    else: 
        return name

def get_package_name():
    name = app_name()
    return name + "Package"

def get_bundle_static():
    name = app_name()
    return ":" + name
