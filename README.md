### Passwords Mobile Application
<img width="1200" alt="cover" src="https://github.com/nicktheodoridisiOS/Passwords/assets/122683142/0c33fb98-74ab-48a1-8558-8ae8fa4f6dc7">

### About Application
Passwords is an iOS mobile app developed with Swift programming language. In this app you have the option through some fields to generate passwords and create your own one as can show you how strong it is and also you can save them in your library.

<img width="1200" alt="generator" src="https://github.com/nicktheodoridisiOS/Passwords/assets/122683142/8d762261-d67c-40b1-a1c3-29a9671551f1">

### Create Your Own Password
<img width="1200" alt="creator" src="https://github.com/nicktheodoridisiOS/Passwords/assets/122683142/9a82fc4b-0e3a-4dde-8045-8b8203b2bbc2">

### Persist Data and Data Synchronization
<img width="80" alt="preferences" src="https://developer.apple.com/assets/elements/icons/swiftdata/swiftdata-96x96_2x.png">

For persistent data and data synchronization, the  [SwiftData](https://developer.apple.com/xcode/swiftdata/) framework was used. This way, the user can store their data by synchronizing it across multiple devices with the same account credentials. This implementation ensures effective management and retrieval of sensitive data, providing the necessary security and reliability for storing user passwords.

```Swift
@Model
class Password{
    var name: String
    var color: String
    
    init(name: String, color: String) {
        self.name = name
        self.color = color
    }
}
```

### Display Preferences
<img width="1200" alt="mode" src="https://github.com/nicktheodoridisiOS/Passwords/assets/122683142/983930a5-d301-4483-b569-ca398cf57608">

### Run Application
https://github.com/nicktheodoridisiOS/Passwords/assets/122683142/9921500d-45a1-4a70-a6b3-3ec49c175b0b

### Project Tools
|Xcode|GitΗub|Figma|
|:---:|:---:|:---:|
|<img width="60" alt="mode" src="https://cdn.jim-nielsen.com/macos/512/xcode-2020-11-11.png?rf=1024">|<img width="60" alt="mode" src="https://cdn.jim-nielsen.com/macos/512/github-desktop-2021-05-20.png?rf=1024">|<img width="60" alt="mode" src="https://cdn.jim-nielsen.com/macos/512/figma-2021-05-05.png?rf=1024">|

### Programming Stack
|Swift|SwiftUI|SwiftData|
|:---:|:---:|:---:|
|<img width="60" alt="mode" src="https://developer.apple.com/assets/elements/icons/swift/swift-96x96_2x.png">|<img width="60" alt="mode" src="https://developer.apple.com/assets/elements/icons/swiftui/swiftui-128x128_2x.png">|<img width="60" alt="mode" src="https://developer.apple.com/assets/elements/icons/swiftdata/swiftdata-96x96_2x.png">|

### Contact
I'm always open to questions, suggestions and comments. If you have any questions or need assistance, feel free to contact me at [nicktheodoridiscontact@gmail.com](mailto:nicktheodoridiscontact@gmail.com) or through my GitHub account.

### Socials

Follow me on social media for the latest news and updates:

- Twitter: [nickiOSDev](https://twitter.com/nickiOSDev)
- Instagram: [nickmadethisone](https://www.instagram.com/nickmadethisone/)
- LinkedIn: [Nikolaos Theodoridis](https://www.linkedin.com/in/nikolaostheodoridis/)

### License
This project is distributed under the [Creative Commons Attribution-NonCommercial 4.0 International License (CC BY-NC 4.0)](https://creativecommons.org/licenses/by-nc/4.0/).

This means you can use, modify and share this work under the following conditions:
- You must attribute the original creator (attribution).
- You may not use this work for commercial purposes (non-commercial use).
