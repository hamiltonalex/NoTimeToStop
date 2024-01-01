# No Time To Stop, Think, Exist.

## Overview
The `NoTimeToStop` app is a visually driven application that combines animation and typography to deliver a thematic message: `No Time To Stop, Think, Exist. Life seemingly filled with never ending tasks`. The app uses several SwiftUI views to animate text and background elements, creating a cohesive and striking presentation.

### Background Animation:
- **FlipView**: This class is responsible for the creation of the circle. It utilizes a 3D scale effect by animating the scale along one axis, which gives the impression of the circle flipping and rotating. The scaling effect contributes to the dynamic nature of the background. During the rotation, when the Circle object reaches the midpoint of its animation cycle, the color is toggled between black and white. This color change is synchronized with the scale effect, resulting in a captivating visual rhythm that keeps the viewer's attention on the screen.

- **OrbView**: The `OrbView` class manages the continuous rotation animation and the scale of the `FlipView` instance. 

### Text Animations:
The Text folder contains Swift files that manage various text animations, which include sliding in, fading in, and lifting effects. Each file corresponds to a specific part of the visual text narrative:

- **NoTimeView**: Animates the "NO TIME" part of the phrase. The animation involves a slide-in effect where the letters come into view horizontally from right to left.

- **ToStopView**: Handles the "TO ..." portion and integrates with `StopThinkExistView` for a combined effect. This involves a fade-in entrance effect to keep consistency with the other text elements.

- **StopThinkExistView**: This class is tasked with animating the words "STOP.", "THINK.", "EXIST." with a lift-up animation. As the text "TO" appears and completes the phrase "TO EXIST.", the subsequent words animate upwards in a stacking fashion, one after the other, to build the final message.

- **SubtitleView**: Manages the smaller text elements such as "Life seemingly filled with never ending tasks." and the other phrases. These subtitles use a turn on animation to subtly bring attention to the additional information, complementing the main animated phrase.

### Summary:
The `NoTimeToStop` app presents a compelling visual narrative using animated text and background elements. The primary visual feature, the rotating circle created by `FlipView` and `OrbView`, sets a dynamic stage for the text animations. The text, managed by various views in the Text folder, uses slide-in, fade-in, and lift-up animations to bring each phrase into the viewer's focus sequentially. The result is a layered presentation that captures the essence of time's fleeting nature and the existential themes the app aims to convey. The interplay of motion and typography creates a powerful and resonant user experience that goes beyond static imagery.

## File Structure
**Main**
- [ContentView.swift](../NoTimeToStop/ContentView.swift)
- [NoTimeToStopApp.swift](../NoTimeToStop/NoTimeToStopApp.swift)

**Background**
- [FlipView.swift](../NoTimeToStop/Background/FlipView.swift)
- [OrbView.swift](../NoTimeToStop/Background/OrbView.swift)

**Text**
- [NoTimeView.swift](../NoTimeToStop/Text/NoTimeView.swift)
- [StopThinkExistView.swift](../NoTimeToStop/Text/StopThinkExistView.swift)
- [SubtitleView.swift](../NoTimeToStop/Text/SubtitleView.swift)
- [ToStopView.swift](../NoTimeToStop/Text/ToStopView.swift)

**Utils**
- [AppConfig.swift](../NoTimeToStop/Utils/AppConfig.swift)
- [TimerManager.swift](../NoTimeToStop/Utils/TimerManager.swift)

## Main Views
- `ContentView`: Describes the main view of the application.
- `NoTimeToStopApp`: The main entry point of the SwiftUI application.

## Background Views
- `FlipView`: Manages the rotating circle effect.
- `OrbView`: Creates a dynamic orb background.

## Text Views
- `NoTimeView`: Manages the animation of the "NO TIME" phrase.
- `StopThinkExistView`: Animates the phrases "STOP.", "THINK.", and "EXIST."
- `SubtitleView`: Controls the display and animation of subtitles.
- `ToStopView`: Manages the animation of the "TO" phrase.

## Utilities
- `AppConfig`: Defines global configuration settings and constants.
- `TimerManager`: Handles timer-based events and animations.

