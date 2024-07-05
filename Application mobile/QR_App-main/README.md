# EdScan Project
EdScan is a mobile application based on QR Codes that facilitate the supervision of students in schools.

## How to Use 

**Step 1:**

Download or clone this repo by using the link below:

```
git clone https://github.com/EdTrust-inc/QR_App.git
```


**Step 2:**

Go to project root and execute the following command in console to get the required dependencies: 

```
flutter pub get 
```
**Step 3:**
```
Run in emulator : flutter run.
```

### Folder Structure
Here is the core folder structure which flutter provides.

```
flutter-app/
|- android
|- build
|- ios
|- lib/
    |- app/ # This is where all the application's directories will be contained  
     - /components # contain custom widget shared in all module 
     - /core
        - /function # contain shared Function 
     - /data # Directory responsible for containing everything related to our data
     - /languages 
     - /modules # contain custom widget shared in all module 
     - /routes
        - app_pages.dart  # This file will contain routes name
        - app_routes.dart # This file will contain routes mangement with getx
     - /services # contain all http request 
    |- main.dart
|- test
```
