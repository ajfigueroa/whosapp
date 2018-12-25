# Whosapp

Disclaimer: This is in no way associated with Whatsapp or Facebook.

## Motivation

My Mother wanted to use Whatsapp on her iPad and if you go to `web.whatsapp.com`, you'll get redirected to the landing page of Whatsapp. You can hold the Refresh button and then tap `Request Desktop Site` but this won't stay if you leave it as a website bookmark on the Springboard.

The user experience around having to constantly tap `Request Desktop Site` is not ideal. I took a look at the iPad apps that do something similar and they are full of ads or predatory tactics to get you to pay a heft subscription fee.

This project is meant to be an ad-free and unpredatory alternative to those apps in the App Store.

## Usage

This app is targeting iOS devices on 12.1 and up.

You'll also need Xcode 10 to install and run the app on a device.

## Screenshots

This app is essentially a webview that opens `web.whatsapp.com` but uses a Desktop user agent to trick the website into thinking the User is on a Desktop instead of an iPad.

<img src="./Screenshots/ipad_screenshot.png" />

## Limitations

This has the same limitations as using Whatsapp on a browser does.
The offline experience could use some more love as it currently just displays some plain HTML telling the user to relaunch the application and check their connection.

However, for most use cases this should be good enough. Enjoy!
