# Zwallet

Zwallet is an open project that create an app to make and manage transaction. The main feature of this app is the user can send money to its friend from the app. At this version the feature that has been created are:
* Register
* Login
* Logout
* Make transaction
* Transaction history

The other feature of Zwallet will be added over time.

This app using VIPER as its design pattern, using iOS 12.1 as minimum SDK, and using following library:
* [KingFisher](https://github.com/onevcat/Kingfisher), to manage image display
* [MOya](https://github.com/Moya/Moya), for network abstaction
* [SkeletonVIew](https://github.com/Juanpe/SkeletonView), to manage skeleton loading

Those dependency are managed by [cocoapods](https://cocoapods.org/)

## Install

To import this project to your computer you need to install Xcode and cocoapods in your computer, and following steps below to open the project:
1. Open terminal then navigate to `./App` or you can navigate to this project folder then right click from App folder and choose `Service > New terminal at folder`
2. Install all dependency using this command:
```
pods install
```
3. If there is no error then you can navigate to `./App` and double click at `Zwallet/xcworkspace`

## Feature

Some feature and scene in this app:

* Register

    [![register](https://i.postimg.cc/QdZH0fw7/simulator-screenshot-167878-D6-107-D-422-E-A469-211-A442796-C7.png)](https://postimg.cc/SJVSKfyQ)

* Login

    [![login](https://i.postimg.cc/d0x7mJYs/simulator-screenshot-C356-A0-FD-0683-4-FFF-99-E7-4-BB367372-B2-A.png)](https://postimg.cc/3y2J35NV)

* Home

    [![search receiver](https://i.postimg.cc/zvdVd5mX/simulator-screenshot-132-A71-BC-2-AA4-47-D4-998-D-51989-F5-CEC78.png)](https://postimg.cc/7J2H6FYp)

* Transfer

    * Search Receiver
        [![search reciever](https://i.postimg.cc/YS3kNRBt/simulator-screenshot-C958-C61-F-836-B-4326-A654-C044306-C4062.png)](https://postimg.cc/rdKvMSpH)

    * Enter Amount
        [![search amount](https://i.postimg.cc/cJ91yh9X/simulator-screenshot-3-F505-B11-D63-D-442-F-AE45-F2-FE92-F7948-A.png)](https://postimg.cc/SX9bc6pM)

    * Confirmation
        [![confirmation](https://i.postimg.cc/RhczFLdr/simulator-screenshot-89-D9-F099-08-B5-4-A5-D-BCA3-BB20-E8-CB6-EAA.png)](https://postimg.cc/q6MFDnWQ)

    * Enter Pin
        [![enter pin](https://i.postimg.cc/4yGS8k6M/simulator-screenshot-35-BF2-D87-5-ABA-49-AB-B00-B-53-FF603-F23-B4.png)](https://postimg.cc/XG2LJPDc)

    * Status

        [![status](https://i.postimg.cc/2yjxbzFz/simulator-screenshot-70-B1856-F-A396-4-D98-A139-F0-FF9-FABE93-B.png)](https://postimg.cc/KkVTChHV)


## Usage
Some usage of this app:

* View, is a component that build the user interface of the app, some view are used are UILabel, UIView, UITable, UICell, UIImage, etc.

* Class, is a object blueprint, so that is object created from this class will have similar attribute, just with different value

* Struct, just like class but usually used to describie fix object. The difference between class and struct is if the Class were assigned into a variable, swift will copy it by reference so if something changed in new variable the old variable will be changed too. But it does not happen with stuct because unlike class, when struct assigned into new variable swift will do something called copy by value.

* Protocol, is a contract to make sure any claass that implement this protocol will have the same attributes described in protocol. In this project mostly protocol were use to create some like abstraction like delegate so if a class cannot do some task it can assign the tast to another class that able to do the task.

* Extension, is an extend of a class, usually used when implement some protocol to some class to make the code easier to read.

* Viper, is an architecture used in this project that grouping the code by its funtionality described by viper, it is:
    * View, a group that focus on describing and managing all interface logic.
    * Interactor, a group that focus on interaction with the server or to make data fetching or posting.
    * Router, group that focus on defining router or navigation used in this particular module. Router also the first responder when the module being called from other module, so the initiation of all viper component is happend here.
    * Entity, group to store all models used in the module
    * Presenter, a group to define all connection among all viper component.