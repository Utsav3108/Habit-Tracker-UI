# Habit Tracker — SwiftUI Design System

**Version:** 1.0
**Platform:** iOS
**UI Framework:** SwiftUI
**Design Direction:** Clean, minimal, Apple-native, soft pastel accents

---

# 1. Design Philosophy

The application should feel:

* Clean
* Calm
* Lightweight
* Apple-native
* Data-oriented without feeling clinical
* Consistent across all screens
* Easy to implement using native SwiftUI components

### Core principle

> **Prefer SwiftUI + SF Symbols over custom assets.**

Do not spend time searching for icons, illustrations, gradients, or external UI assets unless explicitly required.

---

# 2. Typography

Use Apple's **SF Pro** system font.

SwiftUI implementation:

```swift
.font(.system(...))
```

Do not add a custom font package.

## Typography Scale

| Purpose            | Font   |   Weight | Approx. Size |
| ------------------ | ------ | -------: | -----------: |
| Large screen title | SF Pro |     Bold |           34 |
| Section title      | SF Pro | Semibold |           22 |
| Card title         | SF Pro | Semibold |           18 |
| Body               | SF Pro |  Regular |           16 |
| Secondary body     | SF Pro |  Regular |           14 |
| Small label        | SF Pro |   Medium |           13 |
| Statistic number   | SF Pro |     Bold |           28 |
| Large statistic    | SF Pro |     Bold |           34 |
| Navigation label   | SF Pro |   Medium |           12 |

### Screen title

```swift
.font(.system(size: 34, weight: .bold))
```

### Section title

```swift
.font(.system(size: 22, weight: .semibold))
```

### Card title

```swift
.font(.system(size: 18, weight: .semibold))
```

### Body

```swift
.font(.system(size: 16))
```

### Secondary text

```swift
.font(.system(size: 14))
```

---

# 3. Color System

Use SwiftUI `Color` values.

## Primary

### Primary Purple

```text
#635BEB
```

SwiftUI:

```swift
Color(red: 0.388, green: 0.357, blue: 0.922)
```

Use for:

* Selected tab
* Primary buttons
* Active states
* Links
* Progress charts
* Selected dates

---

## Text Colors

### Primary Text

```text
#172033
```

Use for:

* Screen titles
* Habit names
* Important statistics
* Card titles

### Secondary Text

```text
#737A8C
```

Use for:

* Descriptions
* Subtitles
* Secondary statistics
* Metadata

### Tertiary Text

```text
#9AA0AE
```

Use sparingly for:

* Disabled states
* Calendar labels
* Supporting information

---

# 4. Background Colors

### App Background

```text
#F7F8FC
```

### Card Background

```text
#FFFFFF
```

### Secondary Surface

```text
#F1F2F8
```

### Border

```text
#E3E5EC
```

Cards should generally use:

```swift
.fill(Color.white)
```

with a subtle shadow rather than heavy borders.

---

# 5. Semantic Colors

These colors represent habit categories/status rather than the overall brand.

| Meaning    | Color  | Hex       |
| ---------- | ------ | --------- |
| Success    | Green  | `#35B85A` |
| Water      | Blue   | `#2196F3` |
| Reading    | Purple | `#635BEB` |
| Meditation | Orange | `#F59E0B` |
| Journal    | Red    | `#EF5350` |
| Stretch    | Teal   | `#35AFAF` |
| Sleep      | Slate  | `#7A8498` |

These should be used consistently.

---

# 6. Habit Colors

Each habit gets its own accent.

## Workout

```text
Accent: #35B85A
Background: #E8F7EC
```

SF Symbol:

```text
dumbbell.fill
```

---

## Drink Water

```text
Accent: #2196F3
Background: #E8F3FF
```

SF Symbol:

```text
drop.fill
```

---

## Read

```text
Accent: #635BEB
Background: #EEECFF
```

SF Symbol:

```text
book.fill
```

---

## Meditate

```text
Accent: #F59E0B
Background: #FFF4DC
```

SF Symbol:

```text
figure.mind.and.body
```

If that symbol is unavailable on the target deployment, use:

```text
leaf.fill
```

---

## Journal

```text
Accent: #EF5350
Background: #FFEAEA
```

SF Symbol:

```text
pencil
```

---

## Stretch

```text
Accent: #35AFAF
Background: #E6F7F7
```

SF Symbol:

```text
figure.flexibility
```

Fallback:

```text
figure.stand
```

---

## Sleep Early

```text
Accent: #7A8498
Background: #F0F2F6
```

SF Symbol:

```text
moon.fill
```

---

# 7. SF Symbols Library

Use SF Symbols throughout the application.

## Navigation

| UI      | SF Symbol               |
| ------- | ----------------------- |
| Today   | `house.fill`            |
| Stats   | `chart.bar.fill`        |
| Habits  | `checkmark.square.fill` |
| Profile | `person.fill`           |

Unselected versions:

```text
house
chart.bar
checkmark.square
person
```

---

## Common Actions

| Action   | SF Symbol             |
| -------- | --------------------- |
| Add      | `plus`                |
| Back     | `chevron.left`        |
| Forward  | `chevron.right`       |
| More     | `ellipsis`            |
| Search   | `magnifyingglass`     |
| Filter   | `slider.horizontal.3` |
| Settings | `gearshape`           |
| Edit     | `pencil`              |
| Delete   | `trash`               |
| Close    | `xmark`               |
| Check    | `checkmark`           |
| Calendar | `calendar`            |
| Reminder | `bell`                |

---

## Statistics

| Meaning         | SF Symbol                   |
| --------------- | --------------------------- |
| Streak          | `flame.fill`                |
| Completion      | `checkmark.circle.fill`     |
| Total completed | `star.fill`                 |
| Improvement     | `chart.line.uptrend.xyaxis` |
| Goal            | `target`                    |
| Trophy          | `trophy.fill`               |

---

# 8. Icon Styling

Do not use icons as giant standalone symbols.

Use an icon container.

Example:

```text
┌──────────────┐
│              │
│      ♧       │
│              │
└──────────────┘
```

Recommended:

```text
Size: 56 × 56
Corner Radius: 16
Icon Size: 24
```

SwiftUI concept:

```swift
RoundedRectangle(cornerRadius: 16)
    .fill(habit.backgroundColor)
```

Then:

```swift
Image(systemName: habit.symbol)
    .font(.system(size: 24, weight: .medium))
    .foregroundStyle(habit.color)
```

---

# 9. Spacing System

Use an 8-point spacing system.

| Token | Value |
| ----- | ----: |
| XXS   |     4 |
| XS    |     8 |
| S     |    12 |
| M     |    16 |
| L     |    20 |
| XL    |    24 |
| XXL   |    32 |

### Standard screen padding

```text
16–20 pt
```

Recommended:

```swift
.padding(.horizontal, 20)
```

### Section spacing

```text
24 pt
```

### Card internal padding

```text
16–20 pt
```

---

# 10. Corner Radius

| Component            | Radius |
| -------------------- | -----: |
| Small icon container |     16 |
| Habit card           |     20 |
| Large card           |     24 |
| Button               |     20 |
| Search field         |     18 |
| Segmented control    |     20 |
| Avatar               | Circle |

Avoid excessive variation.

The application should mostly feel like:

```text
16 → 20 → 24
```

---

# 11. Shadows

Use very subtle shadows.

Recommended:

```swift
.shadow(
    color: .black.opacity(0.04),
    radius: 12,
    x: 0,
    y: 4
)
```

Do not use dark or large shadows.

The cards should feel like they are slightly floating above the background.

---

# 12. Buttons

## Primary Button

Purple filled button.

```text
Background: #635BEB
Text: White
Height: ~48
Corner Radius: 20
```

Example:

```text
┌────────────────────────┐
│       Add Habit        │
└────────────────────────┘
```

---

## Secondary Button

White background with purple border.

```text
Border: #635BEB
Text: #635BEB
```

Used for:

* View Stats
* Upgrade
* Secondary actions

---

# 13. Checkmark Component

Completed habit:

```text
Circle
Diameter: ~24
Background: habit accent
Icon: checkmark
```

Example:

```swift
Circle()
    .fill(habit.color)
    .frame(width: 24, height: 24)
```

Inside:

```swift
Image(systemName: "checkmark")
    .font(.system(size: 11, weight: .bold))
    .foregroundStyle(.white)
```

Incomplete:

```text
Circle
White / transparent fill
Gray border
```

---

# 14. Progress Ring

Used on **Today** screen.

### Ring

```text
Diameter: ~230
Line Width: 14
```

Background:

```text
#E9EBF3
```

Progress:

```text
#35B85A
```

Center:

```text
4 / 5
Completed
```

SwiftUI component:

```swift
Circle()
    .stroke(...)
```

combined with:

```swift
.trim(from: 0, to: progress)
```

and:

```swift
.rotationEffect(.degrees(-90))
```

This is a good component to implement yourself rather than using an external library.

---

# 15. Bottom Navigation

Four tabs:

```text
Today      Stats      Habits      Profile
```

Height:

```text
~80–90 pt
```

Selected:

```text
Purple
```

Unselected:

```text
Gray
```

Selected icon:

```text
filled SF Symbol
```

Unselected icon:

```text
outline SF Symbol
```

Example:

```text
        🏠
       Today
```

Keep the label small.

---

# 16. Today Screen

## Header

```text
Habit Tracker                         +
Build better habits, every day.
```

Title:

```text
34 / Bold
```

Subtitle:

```text
16 / Regular
Secondary color
```

---

## Week Selector

Horizontal seven-day calendar.

```text
MON   TUE   WED   THU   FRI   SAT   SUN
 26    27    28    29    30    31     1
 ✓     ✓     ●
```

Selected day:

```text
Purple background
White text
```

Completed previous day:

```text
Green checkmark
```

Future/incomplete:

```text
Gray outline circle
```

---

## Today's Progress Card

Contains:

1. Progress ring
2. Day streak
3. Weekly progress
4. Total completed

Card:

```text
White
Corner radius: 24
Padding: 20
```

---

## Habits List

Each habit row:

```text
[Icon]  Workout
        30 min exercise                     ✓
```

Recommended height:

```text
96–112 pt
```

Use a `LazyVStack`.

Avoid embedding a `List` inside a `ScrollView`.

---

# 17. Stats Screen

## Header

```text
Stats                         [This Week]
Track your progress and stay motivated.
```

---

## Overview Card

Four statistics:

```text
85%          12          48          +24%
Overall      Day         Total       Improvement
Completion   Streak      Completed   vs Last Week
```

Use:

```text
SF Symbol
large number
small description
```

---

## Completion Rate

Bar chart.

Days:

```text
Mon Tue Wed Thu Fri Sat Sun
```

Y-axis:

```text
0%
25%
50%
75%
100%
```

Bar color:

```text
Primary Purple
```

Recommended implementation:

Use SwiftUI `Rectangle` / `RoundedRectangle` rather than introducing a chart library for this project.

---

## Habit Performance

Rows containing:

```text
Habit
Goal
M T W T F S S
Completion %
```

Example:

```text
Workout
30 min exercise

● ● ● ● ● ● ○                 86%
```

---

## Streak Calendar

GitHub-style contribution calendar.

Each square represents a day.

Intensity:

```text
0%
1–25%
26–50%
51–75%
76–100%
```

Use progressively lighter/darker versions of the primary purple.

---

# 18. Habits Screen

## Header

```text
Habits                         + Add Habit
Your daily habits, your better future.
```

---

## Segmented Control

```text
All Habits     Active     Completed
```

Selected:

```text
Purple text
Purple underline
```

---

## Search

```text
🔍 Search habits...
```

Use:

```swift
Image(systemName: "magnifyingglass")
```

---

## Filter

SF Symbol:

```text
slider.horizontal.3
```

---

## Habit Card

Each card contains:

```text
[Icon]

Workout
30 min exercise
🔥 12 day streak

M T W T F S S
● ● ● ● ● ● ○

86%
This week

>
```

This is the most information-dense reusable component in the application.

Create it as a reusable SwiftUI view.

Suggested name:

```swift
HabitRowView
```

---

## Consistency Banner

Bottom of Habits screen:

```text
🏆

Consistency is the key!

Keep showing up every day and
your future self will thank you.

[View Stats]
```

Background:

```text
Very light purple
```

---

# 19. Profile Screen

## Header

```text
Profile                         ⚙
Manage your account and preferences.
```

---

## Profile Card

Contains:

* Avatar
* Name
* Short motivational message
* Email
* Member since
* Edit button

Avatar:

```text
72–80 pt
Circle
```

For the first SwiftUI implementation, use:

```swift
Image(systemName: "person.crop.circle.fill")
```

instead of creating a custom avatar asset.

---

# 20. Premium Card

```text
👑  Go Premium

Unlock advanced insights,
unlimited habits and
custom reminders.

                         [Upgrade]
```

Accent:

```text
Orange / Gold
```

SF Symbol:

```text
crown.fill
```

---

# 21. Profile Summary

Four metrics:

```text
85%       12       48       +24%
Overall   Longest  Habits   Improvement
Completion Streak  Completed
```

Reuse the same statistic component from Stats.

---

# 22. Settings Rows

Rows:

```text
Personal Information
Reminders
Appearance
Goals
Health Integrations
Backup & Restore
Privacy & Security
```

SF Symbols:

| Row                  | Symbol                |
| -------------------- | --------------------- |
| Personal Information | `person`              |
| Reminders            | `bell`                |
| Appearance           | `paintpalette`        |
| Goals                | `target`              |
| Health Integrations  | `heart`               |
| Backup & Restore     | `icloud.and.arrow.up` |
| Privacy & Security   | `shield`              |

Each row:

```text
Height: ~56 pt
Icon: 24
Chevron: chevron.right
```

---

# 23. Support Section

```text
Help & Support
About Habit Tracker
```

Symbols:

```text
questionmark.circle
info.circle
```

---

# 24. Logout

Use a full-width outlined destructive button.

```text
Log Out
```

Color:

```text
#EF5350
```

SF Symbol:

```text
rectangle.portrait.and.arrow.right
```

Do not use a filled red button.

The action should feel destructive but visually secondary.

---

# 25. Reusable SwiftUI Components

Build these components once and reuse them.

### Core

```text
AppBackground
PrimaryButton
SecondaryButton
SectionHeader
```

### Habits

```text
HabitIconView
HabitRowView
HabitCheckmark
WeekDayView
HabitProgressView
```

### Statistics

```text
StatItemView
ProgressRingView
CompletionChartView
HabitPerformanceRow
StreakCalendarView
```

### Profile

```text
ProfileHeaderView
SettingsRowView
```

### Navigation

```text
AppTabBar
```

---

# 26. Suggested Model

Do not hard-code UI logic into each screen.

Create a habit model conceptually like:

```text
Habit
 ├── id
 ├── name
 ├── description
 ├── symbol
 ├── color
 ├── backgroundColor
 ├── streak
 ├── weeklyCompletion
 └── completionHistory
```

This allows the same data to drive:

* Today
* Stats
* Habits
* Profile summary

---

# 27. Recommended SwiftUI Architecture

For this project:

```text
HabitTracker
│
├── App
│
├── Models
│   ├── Habit
│   ├── HabitCompletion
│   └── Statistics
│
├── Components
│   ├── HabitRowView
│   ├── ProgressRingView
│   ├── StatItemView
│   ├── WeekDayView
│   ├── SettingsRowView
│   └── AppTabBar
│
├── Features
│   ├── Today
│   │   └── TodayView
│   │
│   ├── Stats
│   │   └── StatsView
│   │
│   ├── Habits
│   │   └── HabitsView
│   │
│   └── Profile
│       └── ProfileView
│
└── Resources
```

---

# 28. SwiftUI Design Tokens

Create a central design-system layer instead of scattering values throughout the project.

Conceptually:

```text
AppColors
AppSpacing
AppRadius
AppTypography
```

For example:

```text
AppColors.primary
AppColors.background
AppColors.secondaryText

AppSpacing.small
AppSpacing.medium
AppSpacing.large

AppRadius.card
AppRadius.button
AppRadius.icon
```

The exact implementation is yours to design.

The important engineering lesson is:

> **Don't let magic numbers spread across your SwiftUI views.**

---

# 29. Screen-to-Screen Consistency

All four screens should share:

```text
Same background
Same typography
Same horizontal padding
Same card radius
Same shadow
Same bottom navigation
Same primary purple
Same SF Symbol language
```

Only the screen-specific content changes.

---

# 30. Asset Policy

### External assets: NOT REQUIRED

Do not search for:

* Workout icons
* Water icons
* Reading icons
* Meditation icons
* Calendar icons
* Statistics icons
* Settings icons
* Navigation icons

Use:

```text
SF Symbols
```

### Images

The Profile avatar can initially be:

```text
person.crop.circle.fill
```

No custom image is required.

---

# 31. SwiftUI Implementation Priority

Build in this order:

### Phase 1 — Design System Foundation

```text

1. Define design tokens
   ├── Colors
   ├── Typography
   ├── Spacing
   ├── Radius
   └── Shadows

2. Establish semantic naming
   ├── primary
   ├── background
   ├── surface
   ├── textPrimary
   ├── textSecondary
   ├── success
   └── destructive

3. Configure Asset Catalog colors
   └── Light / Dark variants

4. Create SwiftUI token APIs
   ├── AppColor
   ├── AppTypography
   ├── AppSpacing
   └── AppRadius

5. Define application icon mapping
   └── SF Symbols

6. Build first reusable primitives
   ├── AppCard
   ├── AppButton
   └── AppText
```

### Phase 2 — Components

```text
6. HabitRowView
7. WeekDayView
8. HabitCheckmark
9. StatItemView
10. ProgressRingView
11. SettingsRowView
12. AppTabBar
```

### Phase 3 — Screens

```text
13. TodayView
14. StatsView
15. HabitsView
16. ProfileView
```

### Phase 4 — Interaction

```text
17. Tab navigation
18. Habit completion
19. Add habit
20. Search
21. Filtering
22. Date selection
23. Statistics updates
```

---

# 32. Important Implementation Rule

The generated designs are **visual references**, not pixel-perfect specifications.

Do not waste time trying to reproduce every pixel.

Prioritize:

1. Layout hierarchy
2. Spacing
3. Typography
4. Component reuse
5. SwiftUI architecture
6. State management
7. Animations/interactions
8. Visual polish

The objective is to build a **real SwiftUI application that happens to look like this design**, not to create a static screenshot.

---

# 33. Final Visual Language

The application should consistently communicate:

```text
                 Habit Tracker
                       ↓
              Calm + Minimal UI
                       ↓
       ┌───────────────────────────┐
       │      White Card            │
       │                            │
       │  SF Symbol   Information  │
       │                            │
       └───────────────────────────┘
                       ↓
              Purple interaction
                       ↓
             Green completion
```

### The three most important colors

```text
Purple → interaction / primary
Green  → success / completed
Gray   → secondary / inactive
```

Everything else is supporting color.

---

# 34. Definition of Done

The UI implementation is considered complete when:

* [ ] All four screens exist
* [ ] Bottom navigation works
* [ ] Typography is consistent
* [ ] All icons use SF Symbols
* [ ] Cards share consistent styling
* [ ] No unnecessary external assets exist
* [ ] Habit rows are reusable
* [ ] Statistics components are reusable
* [ ] Colors are centralized
* [ ] Spacing is centralized
* [ ] Screens work on different iPhone sizes
* [ ] Scroll behavior is correct
* [ ] No `List`/`ScrollView` layout hacks are required
* [ ] Basic interactions are functional
* [ ] UI is driven by models rather than duplicated hard-coded data

---

# Design System Summary

```text
FONT
SF Pro / system

PRIMARY
#635BEB

BACKGROUND
#F7F8FC

CARD
#FFFFFF

PRIMARY TEXT
#172033

SECONDARY TEXT
#737A8C

SUCCESS
#35B85A

BORDER
#E3E5EC

SPACING
4 / 8 / 12 / 16 / 20 / 24 / 32

RADIUS
16 / 20 / 24

ICON SIZE
24

ICON CONTAINER
56 × 56

CARD STYLE
White + 20/24 radius + subtle shadow

NAVIGATION
Today / Stats / Habits / Profile

ICON SYSTEM
SF Symbols

EXTERNAL ASSETS
None required
```



Color/Assets
| Name               | Hex       | Purpose                                |
| ------------------ | --------- | -------------------------------------- |
| `Primary`          | `#635BEB` | Main brand / selected states / buttons |
| `Background`       | `#F7F8FC` | App background                         |
| `Surface`          | `#FFFFFF` | Cards / elevated surfaces              |
| `SecondarySurface` | `#F1F2F8` | Secondary containers                   |
| `Border`           | `#E3E5EC` | Borders / dividers                     |
| `TextPrimary`      | `#172033` | Main text                              |
| `TextSecondary`    | `#737A8C` | Supporting text                        |
| `TextTertiary`     | `#9AA0AE` | Disabled / subtle text                 |
| `Success`          | `#35B85A` | Completed / success                    |
| `Destructive`      | `#EF5350` | Delete / logout / errors               |
