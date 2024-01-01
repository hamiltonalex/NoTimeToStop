# Welcome to "After Effects Meets SwiftUI: The Animation Challenge!"

## 🌟 Introduction

Hey there, fellow code enthusiast! Buckle up, because you're about to embark on an epic journey where the dazzling world of Adobe After Effects collides with the practical universe of SwiftUI.

We're not just talking about any old boring tutorial here. Oh no, we're diving headfirst into the thrilling (and sometimes hair-pulling) challenge of transforming those snazzy animations from After Effects into something your iOS app can strut proudly. It's like teaching cats to swim - challenging but incredibly satisfying once you get there!

## 😂 A Dash of Humor: Memes and Videos

Before we get our hands dirty with code, let's lighten the mood. Imagine this: Designers in one corner, wielding their magical After Effects wands, creating visual masterpieces. And then there's us, the developers, in the other corner, squinting at our screens, trying to turn that magic into reality using Swift programming language on iOS platform. It's like being asked to paint the Mona Lisa with a single crayon. 

We'll kick things off with a few memes and videos that perfectly capture the love-hate relationship between design and code. In these playful sketches, I see reflections of my own journey as a mobile developer in the tech world, where imaginative design meets the grounded reality of coding. I really enjoy them! 😍

#### 😜 Creative Chaos: Inside the Designer's Mind
[![meme 1](https://hamiltonalex.github.io/NoTimeToStop/memes/1d788681cb824953bd36d6ab89bb9bbb_low.png)](https://hamiltonalex.github.io/NoTimeToStop/memes/1d788681cb824953bd36d6ab89bb9bbb.MP4)

#### 🤭 The Design vs The Programmer's POV
[![meme 2](https://hamiltonalex.github.io/NoTimeToStop/memes/v09025g40000chnaeabc77udj6c217q0_low.png)](https://hamiltonalex.github.io/NoTimeToStop/memes/v09025g40000chnaeabc77udj6c217q0.MP4)

#### 🫣 Wait, wait! Let me tell you something... Look up!
[![meme 3](https://hamiltonalex.github.io/NoTimeToStop/memes/v09044g40000ck0sn1rc77u63k8nn9og_low.png)](https://hamiltonalex.github.io/NoTimeToStop/memes/v09044g40000ck0sn1rc77u63k8nn9og.MP4)

#### 😇 Designers' Dreams vs Developers' Nightmares
[![meme 4](https://hamiltonalex.github.io/NoTimeToStop/memes/v10044g50000cbvlclrc77udbo5cjirg_low.png)](https://hamiltonalex.github.io/NoTimeToStop/memes/v10044g50000cbvlclrc77udbo5cjirg.MP4)

#### 🙄 Software Engineering Be Like...
[![meme 5](https://hamiltonalex.github.io/NoTimeToStop/memes/v12044gd0000cgdklpbc77ublvdrnt70_low.png)](https://hamiltonalex.github.io/NoTimeToStop/memes/v12044gd0000cgdklpbc77ublvdrnt70.MP4)

#### 😭 The Never-Ending Tale...
[![meme 6](https://hamiltonalex.github.io/NoTimeToStop/memes/v14044g50000ch17hpbc77u5fuv50b0g_low.png)](https://hamiltonalex.github.io/NoTimeToStop/memes/v14044g50000ch17hpbc77u5fuv50b0g.MP4)

## 🎨 The Challenge: Where Design Meets Code

Our mission, should we choose to embrace it (and why wouldn't we?), is to take, for example, a mesmerizing animation designed and created by the talented Matt Fowler from [Order Design UK](https://www.orderdesign.co.uk) and replicate its magic in SwiftUI. Check the original source on [TikTok](https://www.tiktok.com/@orderdesignuk/video/7226747661267832091). 

Imagine a circle that performs a captivating dance, changing colors as it twirls - simple in appearance, yet a spellbinding spectacle.

This isn't just any animation; it's a visual symphony paired with a thought-provoking motto: 'No time to stop, think, exist. Life seemingly filled with never-ending tasks.' It's a statement that resonates with the hustle of our daily lives, and now, we get to bring it to life through code.

We're going to dissect this animation, much like a curious scientist unraveling the mysteries of the universe, but way more fun and definitely less icky than dissecting a real frog. Piece by piece, we'll translate this visual enchantment into SwiftUI, ensuring our app radiates the same charm and sophistication.

So, arm yourself with your favorite snack, settle into your coziest coding corner, and let's embark on this adventure together. Prepare yourself, because by the end of this journey, you might just be the wizard of the iOS realm, the one they call 'Captain Animation!'

## 📖 Tutorial

### Part 1. Understanding the Design Challenge

#### Showcase Animation:

The initial animation created in After Effects.

[![Order Design UK](https://hamiltonalex.github.io/NoTimeToStop/orderdesignuk/image.png)](https://hamiltonalex.github.io/NoTimeToStop/orderdesignuk/video.mp4)

- **The Key Elements:** 

Let's try to dissect and replicate the same visual effect. The entire animation cycle takes about eight seconds. Half in black and half in white colour theme. Initially, the circle makes a full rotation, and then all elements switch their colors to the opposite. If the text or circle was black, by the midpoint of the first rotation cycle, they turn white. Conversely, if the animation background was white, it turns black. The real trick lies in the animation of the central circle. If we revisit the original TikTok video, we can see the project structure in After Effects, where the circle during the animation is anchored not to its center but to its top part. In the After Effects project there are two main scenes for the background. In the first, the circle merely changes its position in space, anchored along one axis just flips. The second part uses the animation from the first part and adds circular motion, while simultaneously increasing the object's size.

Animating the text is more or less straightforward and understandable, and it doesn't cause any difficulty in grasping what happens with the objects in the scene.

Let's try to recreate all of this in code.

### Part 2. Setting Up Your Development Environment

#### Step 1: Xcode Setup

Welcome to the exciting part where we roll up our sleeves and set up our development environment. We're going to start with Xcode, the playground for all iOS developers. Here's a simple guide to get you up and running:

1. **Download and Install Xcode:**

- First things first, if you haven't already, head over to the Mac App Store and download [Xcode](https://apps.apple.com/gb/app/xcode/id497799835?mt=12). It's a hefty file, so grab a coffee while you wait for it to download. As of December 2023 I use Xcode 15.1.

2. **Create a New iOS Project:**

- Once Xcode is installed, launch it and select 'Create a new Xcode project'.
- Choose an iOS App template. For our tutorial, a Single View App will do just fine.
- Fill in your project details. Be creative with your project name, but maybe not 'SuperCoolApp123' – unless that's your vibe! I am going to use 'NoTimeToStopApp' for the project name.
- For the 'Organization Identifier' type your website or your own name in the reverse order. In my case it will be 'me.alex.hamilton.NoTimeToStop'. For the interface choose 'SwiftUI', language: 'Swift', storage: 'None'. Click Next.

3. **Familiarize Yourself with the Interface:**

- Take a moment to look around. You'll see your project navigator on the left, where all your files will live. The center stage is your editor area – this is where the magic happens.
- The utilities area on the right is where you'll find all the details about your files and data.

4. **Run the Simulator:**

- Click on the play button at the top left to build and run your app. This will fire up the simulator, letting you see what your app looks like in action.

#### Step 2: Prerequisites

Before we dive deeper, let's make sure you're equipped with the essentials:

**Basic Knowledge of Swift:**

- SwiftUI is all about Swift, so a basic understanding of Swift programming is crucial. Don't worry, you don’t need to be a Swift ninja, just comfortable with the basics.

**Familiarity with SwiftUI:**

- If SwiftUI is new to you, it might help to brush up on some [basics](https://developer.apple.com/xcode/swiftui/). There are plenty of tutorials online to get you started.

**Understanding of UI and Animation Concepts:**

- A grasp of basic UI components and how animation works in iOS will be a big help. We're going to animate, so knowing your way around UIViews and Animators will be beneficial.

**Creativity and Patience:**

- Last but not least, bring your creativity to the table and be patient. Learning and experimenting can take time, but that's part of the fun!

Now that you're all set up with Xcode and armed with the essentials, you're ready to bring those After Effects animations to life in your iOS app. Let's get coding! 🚀

### Part 3: Setting Up Your iOS Project

#### Step 1: Organizing the Project

Before we dive into the nitty-gritty of SwiftUI views, we need to lay the groundwork. This includes setting up a `TimerManager`, importing custom TTF fonts, and adding an `AppConfig` file. Let's start by organizing our project into three main folders:

1. **Create Folders for Structure:**

- Open your project in Xcode.
- Right-click on your project's root in the project navigator, and select 'New Group'.
- Name the first group `Background`. This will hold all the files related to the app's background elements.
- Repeat the process to create two more groups: `Text` for text-related files, `Utils` for utility classes like `TimerManager` and configuration files, and the `Resources` folder where we are going to keep our custom font files.

#### Step 2: Importing Custom Fonts

2. **Adding Custom Fonts:**

- You'll need to download the custom fonts used in the original After Effects project. They are available at this [link](https://hamiltonalex.github.io/NoTimeToStop/fonts/fonts.zip). Download and unzip the archive.
- Once downloaded, drag and drop the TTF files into the Text folder in your Xcode project. Make sure to check 'Copy items if needed'.
- To use these fonts in your app, you need to add them to your Info.plist file. By default Info.plist file may not exist. 
- First, select the root of your project in Xcode's project navigator. This is where your project's name appears at the very top.
- Next, find the 'Targets' section in the main panel, and click on your app target, which in this case is 'NoTimeToStop'.
- Once you've selected the target, navigate to the 'Info' tab. Here, you'll see a section titled 'Custom iOS Target Properties'. This is where you can add new properties to your project's configuration.
- Click on the '+' button to add a new property. In the field that appears, type 'Fonts provided by application'. This creates a new array entry in your Info.plist.
- Now, you need to add the font files to this array. Click on the small arrow next to the 'Fonts provided by application' entry to expand it. Then click the '+' button to add new items to the array.
- For each new item, enter the font file names. In your case, add 'Aeonik-Black.ttf' as one item, and 'Aeonik-Bold.ttf' as another.

```plist
<dict>
    <key>UIAppFonts</key>
    <array>
        <string>Aeonik-Bold.ttf</string>
        <string>Aeonik-Black.ttf</string>
    </array>
</dict>
```

3. **Review and Run:**

- After setting up the basic structure, take a moment to review your code and file organization. Make sure everything is correctly placed and named.
- Build and run your project to ensure there are no errors and that the custom fonts are loading correctly.

### Part 4: Writing Utility Classes

#### Step 1: Creating AppConfig

Creating an `AppConfig` file to store all main static values is a best practice in software development. This approach ensures that all key configuration values are centralized in one place, making it easier to manage and update them. It helps avoid mistakes and inconsistencies, as every part of the project references the same source for these values. Having a single reference point for configuration also simplifies the process of making changes, as you only need to update values in one location, and these changes will be reflected across the entire project. This leads to cleaner, more maintainable, and more scalable code.

1. **Create AppConfig File:**
- In the `Utils` folder, create another Swift file and name it `AppConfig.swift`.
- This file will serve as a central place to define global configuration settings for your app.

2. **Defining Animation Settings:**
- Inside the `AppConfig` struct, begin by defining key animation properties:
- `animationDuration`: The duration of animations in seconds.
- `animationDelay`: The delay before starting animations.
- `animationDelaySubtitle`: A specific delay for subtitle animations.
- `totalAnimationDuration`: The total duration of the animation sequence.
- `animationStep`: The step duration in the animation sequence.

3. **Adding Dynamic UI Configurations:**
- Implement dynamic configuration for UI elements, such as font size and view offsets. 
- For instance, `titleFontSize` and `yOffset` can be set based on the device's screen size. Use `UIScreen.main.bounds` to make these values dynamic, accommodating different device sizes.

```swift
struct AppConfig {
    static let animationDuration: Double = 0.3
    static let animationDelay: Double = 0.1
    static let animationDelaySubtitle: Double = 0.04
    static let totalAnimationDuration = 8
    static let animationStep: Double = 2.0
    static var titleFontSize: CGFloat {
        return UIScreen.main.bounds.height <= 736 ? 70 : 80
    }
    static var yOffset: CGFloat {
        return UIScreen.main.bounds.height <= 736 ? -50 : -90
    }
}
```

#### Step 2: Creating `TimerEvent`

Creating a dedicated `TimerManager` class in your iOS app is crucial for ensuring synchronization and efficiency in animations. By centralizing the timing logic in one place, `TimerManager` becomes the single source of truth for managing all animated UI elements. This approach prevents discrepancies in timing that could occur when using separate timing logic in different views. Without a unified timer, animations running across multiple cycles could gradually become out of sync, leading to a disjointed user experience especially if you would organise your animation by using nested `DispatchQueue.main.asyncAfter`.

Additionally, using a single `TimerManager` reduces the load on system resources. Multiple timers can lead to increased computational overhead, as each timer instance consumes resources. A centralized timer manager streamlines this process, making your app more resource-efficient and ensuring smoother animations. This not only enhances performance but also contributes to better battery life and overall app stability. 

Before creating the TimerManager, it's essential to first define the TimerEvent enum. This enum provides a structured way to represent different timing events within the app, ensuring that the TimerManager can respond accurately to specific moments in the animation cycle.

1. **Define the TimerEvent Enum:**
- Create a new Swift file named `TimerEvent.swift`.
- Define an enum named `TimerEvent` with two cases: `eventAtSecond(Int)` for specific events at given seconds, and `.none` for no event.

2. **Implementing from(second:) Method:**
- Add a static method `from(second: Int) -> TimerEvent` within the `TimerEvent` enum.
- This method should return `.eventAtSecond(second)` if the second is within the range of your animation duration (defined in `AppConfig`), otherwise, it returns `.none`.

```swift
enum TimerEvent: Equatable {
    case eventAtSecond(Int)
    case none

    static func from(second: Int) -> TimerEvent {
        return (0...AppConfig.totalAnimationDuration).contains(second) ? .eventAtSecond(second) : .none
    }
}
```

#### Step 3: Setting Up `TimerManager`

1. **Creating TimerManager Class:**
- In a new Swift file, define a class `TimerManager` that conforms to `ObservableObject`.
- Add a published property `currentEvent` of type `TimerEvent`, initially set to `.none`.
- Define properties like `duration` (for step interval), `totalInterval` (for total duration), `currentSecond` (to track current time), and `timer` (for the Combine timer).

2. **Implementing Timer Control Methods:**
- In `TimerManager`, implement a `start()` method to initialize and start the timer, setting `currentSecond` to 0 and using a Combine `Timer` to publish events every second.
- Implement a `stop()` method to cancel and nullify the timer and reset `currentSecond`.

3. **Adding the tick() Method:**
- Implement a `tick()` method in `TimerManager` that increments `currentSecond` and updates `currentEvent` using `TimerEvent.from(second:)`.
- Ensure `currentSecond` wraps around based on the `totalInterval` to create a continuous cycle.

```swift
class TimerManager: ObservableObject {
    @Published var currentEvent: TimerEvent = .none
    
    let duration = AppConfig.animationStep

    private let totalInterval = AppConfig.totalAnimationDuration
    private var currentSecond = 0
    private var timer: AnyCancellable?

    func start() {
        currentSecond = 0

        timer = Timer.publish(every: 1, on: .main, in: .common)
        .autoconnect()
        .sink { [weak self] _ in
            self?.tick()
        }
    }

    func stop() {
        currentSecond = 0
        timer?.cancel()
        timer = nil
    }

    private func tick() {
        self.currentSecond = (self.currentSecond % self.totalInterval) + 1
        self.currentEvent = TimerEvent.from(second: self.currentSecond)
    }
}
```

### Part 5: Integrating TimerManager in the SwiftUI App

In SwiftUI, when we use `.environmentObject` to pass `timerManager`, it's critical to ensure that all child views relying on it have access. Otherwise, attempting to access `timerManager` without it being passed as an environment object can lead to app crashes. This approach is particularly effective when a dependency, like `timerManager`, is required across the entire view hierarchy.

In the case of our demo app, this method is ideal since all views are designed to depend on `TimerManager`. By passing `timerManager` as an environment object, we guarantee its availability in all views, aligning perfectly with our app’s architecture and functionality needs. Should you need a more flexible or optional approach to dependency management in different scenarios, consider direct passing of dependencies or other dependency injection techniques.

1. **Understanding the Main App Structure:**
- Recognize that `NoTimeToStopApp` is the main entry point of your SwiftUI application. It conforms to the `App` protocol, defining the configuration and behavior of the app.

2. **Creating the TimerManager Instance:**
- Within `NoTimeToStopApp`, declare a `@StateObject` property for the `TimerManager`. This creates an instance of `TimerManager` that manages all timer-related logic in your app.
- Using `@StateObject` ensures that the `TimerManager` instance is retained throughout the lifecycle of your app.

3. **Setting Up the App’s Scene:**
- Define the `body` property of `NoTimeToStopApp`. This property should contain a `Scene`, typically a `WindowGroup`, which is the starting point of your app's user interface.
- In the `WindowGroup`, add your main content view, often named `ContentView`.

4. **Passing TimerManager to ContentView:**
- Use the `.environmentObject` modifier on `ContentView` to pass the `timerManager` instance. This makes `timerManager` available to `ContentView` and all its child views.
- This step is crucial for enabling any view within your app to access and respond to the `TimerManager`'s published properties.

5. **Utilizing TimerManager in Views:**
- In your SwiftUI views, you can now use `@EnvironmentObject` to access the `timerManager` instance.
- This allows you to react to changes in the timer’s state, update UI elements, or trigger animations based on timer events.

```swift
@main
struct NoTimeToStopApp: App {
    @StateObject var timerManager = TimerManager()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(timerManager)
        }
    }
}
```

### Part 6: Creating SwiftUI Views for Background

#### Step 1: Implementing FlipView

Now let's focus on building the `FlipView`, a SwiftUI View for creating a visually captivating flip-flop circle scale-up effect. This view lays the groundwork for the background rotation effect used in the `OrbView`.

1. **Setting Up FlipView Structure:**
- Begin by creating a new SwiftUI View file named `FlipView.swift`.
- Define the `FlipView` struct, ensuring it conforms to the `View` protocol.

2. **Defining Properties:**
- Add an `@EnvironmentObject` property for `timerManager` to access the shared timer state.
- Define several `@State` properties for controlling the animation dynamics, such as `reverseAnimation`, `changeColour`, `position`, and `circleWidth`.

3. **Creating Visual Elements:**
- Declare constants for your main visual elements: `circle` as a SwiftUI `Circle` view and `background` as a `Rectangle` view. These will be the primary components of your `FlipView`.

4. **Building the View Body:**
- In the `body` property, use a `ZStack` to layer the `background` and `circle`. Apply relevant modifiers to these views to create the desired visual effects.
- Utilize `.fill`, `.frame`, and `.rotation3DEffect` modifiers to define the appearance and animation behaviors of the `circle`.

5. **Handling Timer Events:**
- Implement a method `handleEvent(at:)` to respond to different `TimerEvent`s. This method should update the state variables like `reverseAnimation` and `changeColour` based on the current event.
- Use `withAnimation` to smoothly transition the view's state changes.

6. **Using GeometryReader for Layout:**
- Add a computed property `geometryReader` that returns a `GeometryReader` view. This is crucial for dynamically setting the position and size of the `circle` based on the parent view’s dimensions.
- Inside `GeometryReader`, use `.onAppear` to set `circleWidth` and `position`.

7. **Responding to Timer Changes:**
- Add an `.onChange` modifier to the main view body to listen for changes in `timerManager.currentEvent`. Call `handleEvent(at:)` when an event occurs.

```swift
struct FlipView: View {
    @EnvironmentObject private var timerManager: TimerManager
    @State private var reverseAnimation = false
    @State private var changeColour = false
    @State private var position = CGPoint.zero
    @State private var circleWidth = Double.zero

    private let circle = Circle()
    private let background = Rectangle()

    var body: some View {
        ZStack {
            background
                .fill(changeColour ? .black : .white)
                .frame(maxWidth: .infinity, maxHeight: .infinity)

            circle
                .fill(changeColour ? .white : .black)
                .frame(width: circleWidth, height: circleWidth)
                .rotation3DEffect(
                    .degrees(reverseAnimation ? 180 : 0),
                    axis: (x: 1.0, y: 0.0, z: 0.0),
                    anchor: .top
                )
                .position(position)
        }
        .ignoresSafeArea()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .overlay(geometryReader)
        .onChange(of: timerManager.currentEvent) { _, event in
            handleEvent(at: event)
        }
    }

    private func handleEvent(at event: TimerEvent) {
        switch event {
            case .eventAtSecond(3), .eventAtSecond(7):
                withAnimation(Animation.easeInOut(duration: timerManager.duration)) {
                    self.reverseAnimation.toggle()
                }
            case .eventAtSecond(4), .eventAtSecond(8):
                self.changeColour.toggle()
            default:
                break
        }
    }

    private var geometryReader: some View {
        GeometryReader { proxy in
            Color.clear
                .onAppear {
                    self.circleWidth = proxy.size.width * 0.5
                    self.position = CGPoint(x: proxy.size.width / 2, y: (proxy.size.height / 2) + (circleWidth / 2))
                }
        }
    }
}
```

Now, let's move on to create `OrbView`, which will display a rotating orb effect by utilizing our previously created `FlipView`. Here are the steps to implement `OrbView` in your SwiftUI app:

#### Step 2: Creating OrbView

1. **Setting Up OrbView:**
- Start by creating a new SwiftUI View file named `OrbView.swift`.
- Define the `OrbView` struct, ensuring it conforms to the `View` protocol.

2. **Defining Properties:**
- Use `@EnvironmentObject` to integrate `timerManager` for accessing shared timer states.
- Declare a `@State` variable `rotationDegrees` to control the rotation angle of the orb. Initially set it to -45.0 degrees.

3. **Building the View Body:**
- Define the body of `OrbView` using a `VStack`.
- Inside the `VStack`, embed the `FlipView` and apply scale and rotation effects. Use the `.scaleEffect` and `.rotationEffect` modifiers for this.
- Adjust the position of the `VStack` using the `.offset` modifier, utilizing values from `AppConfig` for dynamic positioning.

4. **Handling Timer Events:**
- Implement a `handleEvent(at:)` method to respond to `TimerEvent`s. This method will adjust `rotationDegrees` based on the timer events, thereby controlling the rotation of the orb.
- Use a switch case to handle different events, such as resetting the rotation angle or applying an animated rotation to a new angle.

5. **Responding to Timer Changes:**
- Add an `.onChange` modifier to observe changes in `timerManager.currentEvent`. Invoke `handleEvent(at:)` when an event is triggered to update the rotation angle.

By following these steps, you will create an interactive and visually appealing `OrbView` that complements the rotating orb effect in the app.

```swift
struct OrbView: View {
    @EnvironmentObject private var timerManager: TimerManager
    @State private var rotationDegrees = -45.0

    var body: some View {
        VStack {
            FlipView()
                .scaleEffect(4)
                .rotationEffect(.degrees(rotationDegrees))
        }
        .offset(x: -70, y: AppConfig.yOffset)
        .onChange(of: timerManager.currentEvent) { _, event in
            handleEvent(at: event) 
        }
    }

    private func handleEvent(at event: TimerEvent) {
        switch event {
            case .eventAtSecond(2):
                rotationDegrees = -45.0
            case .eventAtSecond(3), .eventAtSecond(7):
                withAnimation(.easeInOut(duration: timerManager.duration)) {
                    rotationDegrees = event == .eventAtSecond(3) ? -225 : -405
                }
            default:
                break 
        }
    }
}
```

6. **Adding OrbView to the ContentView. Reviewing the Background Animation:**
- As you progress through each part of this tutorial, it's important to periodically review and test what you've accomplished. Let's add a step where you can check how the background animation works in the `ContentView`.

7. **Integrating OrbView:**
- Start by ensuring the `OrbView` is placed within a `ZStack` in the `ContentView`. This is your primary background view.
- The `ZStack` allows for additional views to be layered on top of `OrbView` as you progress in the tutorial.

8. **Setting Up TimerManager:**
- Make sure you have the `timerManager` as an `EnvironmentObject` in `ContentView`. This object manages the timing for your animations.
- Use `.onAppear` to start the timer when `ContentView` appears. This triggers the animation sequence managed by `TimerManager`.
- Implement `.onDisappear` to stop the timer when `ContentView` is not visible. This helps in resource management and ensures the app performs efficiently.

9. **Testing the Background Animation:**
- Run your app to see the `OrbView` in action. Ensure that the animation starts as expected when `ContentView` appears.
- Observe the behavior of the animation and verify that it stops when you navigate away from `ContentView`.

10. **Debugging and Adjustments:**
- If the animation doesn't behave as expected, check the implementation of your `TimerManager` and `OrbView`.

11. **Preparing for Further Additions:**
- As you proceed to add more elements to `ContentView`, keep the structure organized and manageable.
- Remember, `ContentView` will eventually become a complex view integrating various subviews, so maintaining clarity in your code is key.


```swift
struct ContentView: View {
    @EnvironmentObject private var timerManager: TimerManager

    var body: some View {
        ZStack {
            OrbView()
        }
        .onAppear {
            timerManager.start()
        }
        .onDisappear {
            timerManager.stop()
        }
    }
}
```

### Part 7: Creating SwiftUI Views for Text Elements

#### Step 1: Implementing NoTimeView

Now, let's develop the `NoTimeView`, a SwiftUI view designed to display and animate the phrase "NO TIME". This view will use environment objects, state variables, and animations to create an engaging text effect.

1. **Setting Up NoTimeView:**
- Create a new SwiftUI View file named `NoTimeView.swift`.
- Define the `NoTimeView` struct, making sure it conforms to the `View` protocol.

2. **Defining Properties:**
- Use `@EnvironmentObject` to integrate `timerManager` for accessing shared timer states.
- Declare `@State` variables `phraseOffset`, `opacityOffsets`, and `changeColour` to control the animation and appearance of the text.

3. **Building the Text Layout:**
- In the `body` property, use an `HStack` to lay out individual characters of the text for animation.
- For each character in the phrase "NO TIME", apply font settings, color, and opacity. Use `opacityOffsets` to control the fade-in effect of each letter.

4. **Animating Text on Appearance:**
- Implement the `startAnimation()` method, which is triggered by `.onAppear`. This method will animate `phraseOffset` for a slide-in effect and update `opacityOffsets` for each letter, creating a fade-in animation.

5. **Handling Timer Events:**
- Add an `.onChange` modifier to respond to changes in `timerManager.currentEvent`. Invoke `handleEvent(at:)` to control text animation based on timer events.
- The `handleEvent(at:)` method should handle specific `TimerEvent`s by resetting and restarting the text animation.

6. **Creating Animation Methods:**
- The `startAnimation()` method should include animations for sliding in the text and fading in each letter with appropriate durations and delays.
- Implement `resetAnimation()` to reset the animation states, including `phraseOffset` and the opacities of each letter.

```swift
struct NoTimeView: View {
    @EnvironmentObject private var timerManager: TimerManager
    @State private var phraseOffset: CGFloat = 100
    @State private var opacityOffsets = [Int: CGFloat]()
    @State private var changeColour = false

    private let text = "NO TIME"

    var body: some View {
        HStack {
            HStack(spacing: -3) {
                ForEach(Array(text.enumerated()), id: \.offset) { index, letter in
                    Text(String(letter))
                        .font(Font.custom("Aeonik", size: AppConfig.titleFontSize))
                        .fontWeight(.black)
                        .kerning(-3)
                        .foregroundColor(changeColour ? .white : .black)
                        .opacity(opacityOffsets[index] ?? 0)
                }
            }
            .offset(x: phraseOffset, y: 0)

            Spacer()
        }
        .onAppear {
            startAnimation()
        }
        .onChange(of: timerManager.currentEvent) { _, event in
            handleEvent(at: event)
        }
    }

    private func handleEvent(at event: TimerEvent) {
        switch event {
            case .eventAtSecond(4), .eventAtSecond(8):
                resetAnimation()
                startAnimation()
            default:
                break
        }
    }

    private func startAnimation() {
        withAnimation(Animation.easeInOut(duration: 1)) {
            phraseOffset = CGFloat.zero
        }

        for index in 0..<text.count {
            let reverseIndex = text.count - 1 - index
                withAnimation(Animation.easeInOut(duration: AppConfig.animationDuration)
                    .delay(Double(reverseIndex) * AppConfig.animationDelay)) {
                        opacityOffsets[index] = 1
                    }
        }
    }

    private func resetAnimation() {
        phraseOffset = 100
        
        for index in 0..<text.count {
            opacityOffsets[index] = CGFloat.zero
        }

        changeColour.toggle()
    }
}
```

7. **Integrating `NoTimeView` in ContentView: Previewing the Combined Animation:**
- After completing the `NoTimeView`, it's time to integrate and preview it within the `ContentView` to see how it works in conjunction with the background.

8. **Adding NoTimeView to ContentView:**
- In your `ContentView`, make sure you have a `VStack` that will hold the `NoTimeView`.
- Place the `NoTimeView` inside the `VStack`. This stack allows for the vertical alignment and organization of additional views you'll add later.

9. **Adjusting Frame and Spacing:**
- Apply a `.frame` modifier to `NoTimeView` to control its size within `ContentView`. In this case, set the height to 65.
- Use `.spacing(3)` in the `VStack` to ensure consistent spacing between the elements.

10. **Setting Up Padding:**
- Add `.padding(15)` to the `VStack` to give some space around the edges of your content, enhancing visual appeal and readability.

11. **Previewing the Animation:**
- Run your app and navigate to the `ContentView`. You should now see the `NoTimeView` animated alongside the `OrbView` in the background.
- Observe how the `NoTimeView` integrates with the overall layout and animation flow of the app.

```swift
struct ContentView: View {
    @EnvironmentObject private var timerManager: TimerManager

    var body: some View {
        ZStack {
            OrbView()

            VStack(alignment: .leading, spacing: 3) {
                NoTimeView().frame(height: 65)

                Spacer()
            }
            .padding(15)
        }
        .onAppear {
            timerManager.start()
        }
        .onDisappear {
            timerManager.stop()
        }
    }
}
```

#### Step 2: Implementing StopThinkExistView

In this step, we'll be focusing on the `StopThinkExistView`, a SwiftUI view designed to display and animate the phrases "STOP.", "THINK.", and "EXIST." with dynamic text effects.

1. **Setting Up StopThinkExistView:**
- Begin by creating a new SwiftUI View file named `StopThinkExistView.swift`.
- Define the `StopThinkExistView` struct, ensuring it conforms to the `View` protocol.

2. **Defining Properties:**
- Use `@EnvironmentObject` to integrate `timerManager` for accessing shared timer states.
- Declare a `@Binding` variable `begin` to control the start of the animations.
- Define `@State` variables like `characterVisibilities`, `yOffset`, and `changeColour` for managing the animation states.

3. **Constructing the View Body:**
- In the `body` of `StopThinkExistView`, use a `ZStack` and conditionally display the content based on the `begin` variable.
- Apply a vertical offset and frame height to the `ZStack` using the `.offset` and `.frame` modifiers.

4. **Animating Text on Start:**
- Implement the `startAnimating()` method, which will be triggered by the change of the `begin` variable.
- This method should initiate the animation sequence for the view, including fading in characters and lifting up the words.

5. **Handling Individual Letter Animations:**
- Create a method `animateLetters(of:)` to animate each letter of a word, applying fade-in effects using `characterVisibilities`.

6. **Animating the First Word:**
- Implement `animateFirstWord()` to animate the letters of the first word ("STOP.") with a sequential fade-in effect.

7. **Animating Word Lift-Up:**
- Implement `animateWordLiftUp()` to create a lift-up animation for the words, giving the effect of stacking each word on top of the other.

8. **Testing StopThinkExistView:**
- Run your app to ensure that `StopThinkExistView` behaves as expected, animating each word and letter according to the specified effects.
- Verify the timing, color changes, and positioning of the animations to align with your design goals.

```swift
struct StopThinkExistView: View {    
    @Binding var begin: Bool
    
    @EnvironmentObject private var timerManager: TimerManager
    @State private var characterVisibilities = [Int: Double]()
    @State private var yOffset: CGFloat = 70
    @State private var changeColour = false

    private let wordHeight: CGFloat = 70
    private let words = ["STOP.", "THINK.", "EXIST."]

    var body: some View {
        ZStack {
            if begin {
                VStack(spacing: 0) {
                    content
                }
            }
        }
        .frame(height: wordHeight)
        .offset(y: yOffset)
        .onChange(of: begin) { _, newValue in
            if newValue {
                startAnimating()
            }
        }
    }

    private var content: some View {
        ForEach(words.indices, id: \.self) { wordIndex in
            if wordIndex == 0 {
                HStack {
                    animateLetters(of: words[wordIndex])
                    Spacer()
                }
            } else {
                HStack {
                    Text(words[wordIndex])
                        .font(Font.custom("Aeonik", size: AppConfig.titleFontSize))
                        .fontWeight(.black)
                        .kerning(-3)
                        .frame(height: wordHeight)
                        .foregroundColor(changeColour ? .black : .white)
                    Spacer()
                }
            }
        }
    }

    private func animateLetters(of word: String) -> some View {
        HStack(spacing: -3) {
            ForEach(Array(word.enumerated()), id: \.offset) { index, letter in
                Text(String(letter))
                    .font(Font.custom("Aeonik", size: AppConfig.titleFontSize))
                    .fontWeight(.black)
                    .opacity(characterVisibilities[index] ?? 0)
                    .foregroundColor(changeColour ? .black : .white)
                    .onAppear {
                        withAnimation(Animation.easeInOut(duration: AppConfig.animationDuration)
                            .delay(Double(index) * AppConfig.animationDelay)) {
                                characterVisibilities[index] = 1
                            }
                    }
            }
        }
        .frame(height: wordHeight)
    }

    private func startAnimating() {
        resetStates()
        animateFirstWord()
        animateWordLiftUp()
    }

    private func resetStates() {
        changeColour.toggle()
        characterVisibilities = [Int: Double]()
        yOffset = 70
    }

    private func animateFirstWord() {
        for index in 0..<words[0].count {
            withAnimation(Animation.easeInOut(duration: AppConfig.animationDuration)
                .delay(Double(index) * AppConfig.animationDelay)) {
                    characterVisibilities[index] = 1
                }
        }
    }

    private func animateWordLiftUp() {
        let liftAnimationDuration = 0.8
        let delayBetweenAnimations = 0.05

        for index in 1..<words.count {
            let delay = Double(index) * (liftAnimationDuration + delayBetweenAnimations)
            DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                withAnimation(Animation.easeIn(duration: liftAnimationDuration)) {
                    yOffset -= wordHeight
                }
            }
        }
    }
}
```

#### Step 3: Implementing ToStopView

Next, we'll focus on developing the `ToStopView` to display and animate the phrase "TO" and integrate it with `StopThinkExistView` for a combined animation effect.

1. **Setting Up ToStopView:**
- Start by creating a new SwiftUI View file named `ToStopView.swift`.
- Define the `ToStopView` struct, ensuring it conforms to the `View` protocol.

2. **Defining Properties:**
- Integrate `timerManager` using `@EnvironmentObject` for accessing the shared timer state.
- Declare `@State` variables such as `characterVisibilities`, `startLiftUpEffect`, and `changeColour` for managing the animation and appearance.

3. **Building the View Body:**
- In the `body`, use a `VStack` to layout the animated text "TO" and integrate `StopThinkExistView`.
- Utilize an `HStack` to create and position individual letters for the word "TO" and apply the `textWithEffect` method for animation.

4. **Animating Text on Appearance:**
- Implement `startAnimation()` in the `.onAppear` modifier to initiate the animation sequence for the text and trigger the lift-up effect in `StopThinkExistView`.

5. **Creating Text with Effect:**
- Define `textWithEffect(_:, index:)` to configure the appearance and animation of individual characters. Apply font settings, opacity, and color based on the current state.

6. **Handling Timer Events:**
- Add `.onChange` to respond to `timerManager.currentEvent`. Use `handleEvent(at:)` to control the text animation based on timer events.

7. **Implementing Animation Methods:**
- The `startAnimation()` method should sequentially fade in each character and then trigger the lift-up effect for the subsequent `StopThinkExistView`.
- Implement `resetAnimation()` to reset the animation states for a new cycle.
- Use `fadeInCharacter(at:)` for the fade-in effect of each character.

```swift
struct ToStopView: View {
    @EnvironmentObject private var timerManager: TimerManager
    @State private var characterVisibilities = [Int: Double]()
    @State private var startLiftUpEffect = false
    @State private var changeColour = false
    
    private let text = "TO"
    
    var body: some View {
        VStack(alignment: .center) {
            HStack(alignment: .center, spacing: -8) {
                ForEach(Array(text.enumerated()), id: \.offset) { index, character in
                    textWithEffect(String(character), index: index)
                }
                
                StopThinkExistView(begin: $startLiftUpEffect)
                    .padding(.leading, 20)

                Spacer()
            }
            .padding(.bottom, 8)
        }
        .frame(height: 60)
        .mask(Rectangle().frame(height: 60))
        .onAppear {
            startAnimation()
        }
        .onChange(of: timerManager.currentEvent) { _, event in
            handleEvent(at: event)
        }
    }

    private func handleEvent(at event: TimerEvent) {
        switch event {
            case .eventAtSecond(4), .eventAtSecond(8):
                resetAnimation()
                startAnimation()
            default:
                break
        }
    }

    private func textWithEffect(_ text: String, index: Int) -> some View {
        Text(text)
            .font(Font.custom("Aeonik", size: AppConfig.titleFontSize))
            .fontWeight(.black)
            .kerning(-3)
            .opacity(characterVisibilities[index] ?? 0)
            .foregroundColor(changeColour ? .white : .black)
    }

    private func startAnimation() {
        let totalDelay = Double(text.count) * AppConfig.animationDelay
        
        for index in 0..<text.count {
            fadeInCharacter(at: index)
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + totalDelay) {
            startLiftUpEffect = true
        }
    }

    private func resetAnimation() {
        characterVisibilities = [Int: Double]()
        startLiftUpEffect = false
        changeColour.toggle()
    }

    private func fadeInCharacter(at index: Int) {
        withAnimation(Animation.easeInOut(duration: AppConfig.animationDuration)
            .delay(Double(index) * AppConfig.animationDelay)) {
                characterVisibilities[index] = 1
        }
    }
}
```

8. **Testing ToStopView:**

```swift
    ...

    NoTimeView().frame(height: 65)
    ToStopView().frame(maxHeight: 65)

    ...
```
- Add `ToStopView().frame(maxHeight: 65)` to the ContentView.
- Run your app and ensure that `ToStopView` correctly animates the "TO" text and interacts seamlessly with `StopThinkExistView`.
- Check the timing, color changes, and alignment of the animations to ensure they meet our design requirements.


#### Step 4: Implementing SubtitleView

Now, let's create the `SubtitleView` to display and animate subtitles, adding dynamic text effects to your SwiftUI application.

1. **Setting Up SubtitleView:**
- Begin by creating a new SwiftUI View file and name it `SubtitleView.swift`.
- Define the `SubtitleView` struct, ensuring it conforms to the `View` protocol.

2. **Defining Properties:**
- Integrate `timerManager` using `@EnvironmentObject` for accessing the shared timer state.
- Declare a `@Binding` variable `begin` to indicate the start of animations.
- Define `@State` variables like `changeColour` and `characterVisibility` for managing individual character animations.

3. **Building the View Body:**
- In the `body`, use an `HStack` to layout each character of the `text` for animation.
- Apply the `characterView` method to each character for individual control of appearance and animation.

4. **Animating Text on Start:**
- Implement `startAnimation()` within the `.onChange` modifier for `begin`. This method initiates the character animations sequentially.

5. **Creating Character View with Animation:**
- Define `characterView(_:, at:)` to create a view for each character. Configure its appearance, opacity for animation, and color based on the current state.

6. **Handling Timer Events:**
- Add another `.onChange` to respond to `timerManager.currentEvent`. Use `handleEvent(at:)` to control the reset of the text animation based on timer events.

7. **Implementing Animation Methods:**
- The `startAnimation()` method should sequentially animate each character's appearance with a delay.
- Implement `resetAnimation()` to reset the animation states, preparing for the next cycle.

8. **Testing SubtitleView:**
- Run your app to ensure that `SubtitleView` animates each character correctly based on the `begin` trigger and responds to timer events.
- Check the fade-in effects, color changes, and overall alignment of the animations with your design goals.

```swift
struct SubtitleView: View {
    @Binding var begin: Bool
    
    var text: String
    var size: Double = 7
    var delay: Double = AppConfig.animationDelaySubtitle

    @EnvironmentObject private var timerManager: TimerManager
    @State private var changeColour = false
    @State private var characterVisibility: [Int: Double] = [:]

    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            ForEach(Array(text.enumerated()), id: \.offset) { index, character in
                characterView(character, at: index)
            }
        }
        .onChange(of: begin) { _, newValue in
            if newValue {
                startAnimation()
            }
        }
        .onChange(of: timerManager.currentEvent) { _, event in
            handleEvent(at: event)
        }
    }

    private func handleEvent(at event: TimerEvent) {
        if [.eventAtSecond(4), .eventAtSecond(8)].contains(event) {
            resetAnimation()
        }
    }

    private func characterView(_ character: Character, at index: Int) -> some View {
        Text(String(character))
            .font(Font.custom("Aeonik", size: size))
            .fontWeight(.bold)
            .opacity(characterVisibility[index, default: 0])
            .foregroundColor(changeColour ? .white : .black)
    }

    private func startAnimation() {
        for index in 0..<text.count {
            DispatchQueue.main.asyncAfter(deadline: .now() + delay * Double(index)) {
                characterVisibility[index] = 1
            }
        }
    }

    private func resetAnimation() {
        begin = false
        changeColour.toggle()
        characterVisibility = [:]
    }
}
```

### Part 8: Add Subtitles to the ContentView

The `ContentView` is the main view of our SwiftUI application, where we bring together all our subviews created earlier. Make sure your code looks similar to this:

1. **Integrating TimerManager and State Variables:**
- Use `@EnvironmentObject` to integrate `timerManager`.
- Declare multiple `@State` variables to control the visibility of different subtitles, each representing a stage in the animation.

2. **Constructing the Main View Body:**
- Within a `VStack`, place `SubtitleView` instances for each subtitle, aligning them appropriately.

3. **Animating Subtitles:**
- Implement `startSubtitlesAnimation()` to sequentially trigger the animations for each subtitle view.
- Utilize `DispatchQueue.main.asyncAfter` to manage the timing of each animation's start.

4. **Handling Timer Events:**
- Add an `.onChange` modifier to respond to `timerManager.currentEvent`. Use `handleEvent(at:)` to reset and restart subtitle animations based on timer events.

5. **Calculating Animation Durations:**
- Implement `calculateTotalAnimationDuration(for:)` to determine the animation duration for each subtitle text based on its length and a predefined delay.

6. **Testing ContentView:**
- Run your app to ensure that `ContentView` correctly orchestrates the animations of all subviews.
- Verify that the subtitles and main titles animate as intended, aligning with the timing managed by `TimerManager`.


```swift
struct ContentView: View {
    @EnvironmentObject private var timerManager: TimerManager
    @State private var runSubtitle0 = false
    @State private var runSubtitle1 = false
    @State private var runSubtitle2 = false
    @State private var runSubtitle3 = false
    @State private var runSubtitle4 = false
    
    private enum Subtitles {
        static let subtitle0 = "CLB 003"
        static let subtitle1 = "LIFE SEEMINGLY FILLED"
        static let subtitle2 = "WITH NEVER-ENDING TASKS."
        static let subtitle3 = "ORDERDESIGNUK"
        static let subtitle4 = "X BM/000 325"
    }

    var body: some View {
        ZStack {
            OrbView()

            VStack(alignment: .leading, spacing: 3) {
                HStack {
                    Spacer()
                    SubtitleView(begin: $runSubtitle0, text: Subtitles.subtitle0, delay: 0.4)
                }

                NoTimeView().frame(height: 65)
                ToStopView().frame(maxHeight: 65)

                HStack(spacing: 15) {
                    VStack(alignment: .leading) {
                        SubtitleView(begin: $runSubtitle1, text: Subtitles.subtitle1)
                        SubtitleView(begin: $runSubtitle2, text: Subtitles.subtitle2)
                    }

                    VStack(alignment: .leading) {
                        SubtitleView(begin: $runSubtitle3, text: Subtitles.subtitle3)
                        SubtitleView(begin: $runSubtitle4, text: Subtitles.subtitle4)
                    }
                }

                Spacer()
            }
            .padding(15)
        }
        .onAppear {
            timerManager.start()
            startSubtitlesAnimation()
            runSubtitle0 = true
        }
        .onDisappear {
            timerManager.stop()
        }
        .onChange(of: timerManager.currentEvent) { _, event in
            handleEvent(at: event)
        }
    }

    private func handleEvent(at event: TimerEvent) {
        switch event {
            case .eventAtSecond(4), .eventAtSecond(8):
                startSubtitlesAnimation()
                runSubtitle0 = true
            default:
                break
        }
    }

    private func startSubtitlesAnimation() {
        var cumulativeDelay = Double.zero
        let subtitleBindings = [
            $runSubtitle1,
            $runSubtitle2,
            $runSubtitle3,
            $runSubtitle4
        ]

        let subtitleTexts = [
            Subtitles.subtitle1,
            Subtitles.subtitle2,
            Subtitles.subtitle3,
            Subtitles.subtitle4
        ]

        for (index, subtitleBinding) in subtitleBindings.enumerated() {
            let animationDelay = calculateTotalAnimationDuration(for: subtitleTexts[index])
            DispatchQueue.main.asyncAfter(deadline: .now() + cumulativeDelay) {
                subtitleBinding.wrappedValue = true
            }

            cumulativeDelay += animationDelay
        }
    }

    private func calculateTotalAnimationDuration(for text: String) -> Double {
        return Double(text.count) * AppConfig.animationDelaySubtitle
    }
}
```

7. **Final Result:**

 [![Final Result](https://hamiltonalex.github.io/NoTimeToStop/final/final_result.png)](https://hamiltonalex.github.io/NoTimeToStop/final/final_result.mov)


### Part 9: 🌟 Final Thoughts

Congratulations on completing this journey through the tutorial! As we wrap up, I want to share some reflections that I hope will inspire you further.

#### Embracing Interactive Design in iOS Apps

I have a deep appreciation for beautifully crafted and interactive designs in iOS applications. There's something truly magical about how designers bring their visions to life using tools like Adobe After Effects. Their work is not just visually appealing but often infused with creativity and inspiration.

#### My Goal: Bridging Design and Development

The primary aim of this tutorial was to encourage iOS developers to embrace the challenge of animation. The idea is to step beyond the realm of static UIs and bring a richer, more engaging user experience to the apps we develop. By following along with this tutorial, you've seen firsthand how animations can transform an application from the ordinary to the extraordinary.

#### A Call to Action

I urge you to see this not just as a learning exercise but as a call to action. We, as developers, have an incredible opportunity to collaborate with designers to bring their creative inspirations to life. It’s about going the extra mile to enrich our apps with elements that delight and engage users.

#### Your Role in the Creative Process

You've now seen how you can take animation challenges head-on and implement designer inspirations within your iOS projects. Each line of code you write, every animation you integrate, adds a unique touch to the user's experience. Your role in the creative process is pivotal – it's a blend of technical skill and artistic vision.

#### Looking Forward

As you move forward, I encourage you to keep experimenting, exploring, and pushing the boundaries of what's possible in app development. Your journey doesn't end here; it's just the beginning of a more vibrant and dynamic approach to iOS development.

Let's continue to build apps that aren't just functional but are also a joy to interact with. Here's to creating experiences that resonate with users and stand out in the digital landscape!


### 🧩 Bonus Section: Community Challenge

If you've enjoyed the journey and are eager to dive a bit deeper, there's an additional aspect of the original After Effects animation you can explore and implement as an exercise.

#### The Challenge:

In the original After Effects design, an interesting detail is the background behind the spinning circle. Unlike a solid black color, it features a circular gradient — black on the perimeter, gradually blending into a slightly lighter black towards the center. This subtle gradient is visible as the circle takes its spin in the main view, adding depth and a more dynamic feel to the animation.

#### Your Task:

Your challenge, should you choose to accept it, is to recreate this circular gradient effect in SwiftUI.

#### 🤝 Share Your Work:

If you're up for the challenge, we'd love to see your implementation! Feel free to share your thoughts, progress, or any innovative tweaks you've added. Your contributions and creative insights could be immensely valuable to others following this tutorial. 

This task is an excellent opportunity to enhance your SwiftUI skills further and add an extra layer of polish to your animation. Good luck, and happy coding!
