# CYBAVO Device Security Example

## Project setup

1. In ~/.ssh/ create a file called config with contents based on this:
    ```
    Host bitbucket.org
    HostName bitbucket.org
    User git
    IdentityFile ~/.ssh/{{your private key}}
    ```
2. Run ```sudo gem install cocoapods``` to install CocoaPods(skip this step if CocoaPods has installed already).
3. Create a Xcode project.
4. Run ```pod init``` to add Pods to your Xcode project.
5. Edit `Podfile`, add `source 'https://github.com/CocoaPods/Specs.git'` and
  `https://bitbucket.org/cybavo/Specs_512.git`
   
6. Run ```pod install``` to install all dependencies.
7. Open ```{{your project name}}.xcworkspace``` in xcode.


## Property references

Property      | Description
--------------|-----------------------------
isJailBroken                 | Is device jail-broken.
isEmulator                   | Is device an emulator.
isDebuggingEnabled           | Is app debugging.

