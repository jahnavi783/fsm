# Field Service Management (FSM) App - Complete UI/UX Redesign Prompt

## 🎯 Project Overview
Redesign the entire FSM mobile application with a focus on Field Service Engineer (FSE) workflows, symmetrical UI components, shared widgets, and a clean navigation structure that minimizes cognitive load.

---

## 🏗️ Architecture & Navigation Structure

### Primary Navigation
- **Navigation Drawer (Left Side)**: Contains Settings, Profile, and Quick Actions
- **Bottom Navigation Bar**: 4 tabs (remove Calendar, mark as "Coming Soon")
  - Dashboard
  - Documents  
  - Parts
  - Profile
- **Single FAB**: AI Chatbot button (bottom-right, navigates to chatbot page)

### AppBar Simplification
**Remove from AppBar**: Settings button (move to drawer), excessive action buttons

**Keep in AppBar**: 
- App title/logo
- Search icon (context-aware: searches current screen content)
- Refresh/Sync icon (only visible when in offline mode)
- Menu hamburger icon (opens drawer)

---

## 📱 Screen-by-Screen Design Specifications

## 1. DASHBOARD SCREEN

### Layout Structure
```
AppBar
  ├─ Hamburger Menu (left)
  ├─ "Dashboard" title
  └─ Search icon (right)

[Offline Mode Banner] - Only when offline, amber/yellow, dismissible
  "You're offline. Changes will sync when connected."

Content Area:
  ├─ Current Work Order Card (if FSE has WO in progress)
  │   └─ Full-width, elevated card with gradient accent
  │
  ├─ Status Summary Grid (2x2 or 2x3 layout - EVEN NUMBER)
  │   ├─ Unassigned (3)
  │   ├─ Assigned (1)
  │   ├─ Paused (0)
  │   └─ Completed (1)
  │   [Note: Remove "In Progress" card - shown as current WO card instead]
  │
  └─ Work Orders List
      └─ Grouped by status with collapsible sections

FAB (bottom-right): AI Chatbot icon
```

### Component Details

#### A. Current Work Order Card (Prominent Position)
**When FSE has active work order:**
```
┌─────────────────────────────────────────┐
│ 🔄 IN PROGRESS                          │
│                                         │
│ WO-20250909-0003                    ⚠️  │
│ Hydraulic valve not responding          │
│                                         │
│ 📍 Chicago        🕐 Started: 10:30 AM  │
│                                         │
│ [Quick Actions Row]                     │
│ ┌──────┐ ┌──────┐ ┌──────┐ ┌──────┐   │
│ │ Pause│ │ Parts│ │ Docs │ │Complete│  │
│ └──────┘ └──────┘ └──────┘ └──────┘   │
└─────────────────────────────────────────┘
```

**Specifications:**
- Full width with 16dp horizontal margins
- Elevated shadow (elevation: 4)
- Left border accent (4dp width, orange/amber color)
- Top section: Status badge + WO number + Priority indicator
- Middle: Issue description (max 2 lines, ellipsis)
- Bottom: Location + Time info
- Action buttons row with icons + text
- Rounded corners: 12dp
- Background: White/Surface color

#### B. Status Summary Grid (2x2 Layout - EVEN NUMBER)
```
┌─────────────────┐  ┌─────────────────┐
│ 📋              │  │ 📝              │
│                 │  │                 │
│       3         │  │       1         │
│  Unassigned     │  │   Assigned      │
│                 │  │                 │
└─────────────────┘  └─────────────────┘

┌─────────────────┐  ┌─────────────────┐
│ ⏸️               │  │ ✅              │
│                 │  │                 │
│       0         │  │       1         │
│    Paused       │  │   Completed     │
│                 │  │                 │
└─────────────────┘  └─────────────────┘
```

**Specifications:**
- Equal height cards in 2 columns
- 12dp gap between cards
- 16dp horizontal margins
- Each card:
  - Aspect ratio: 1:1 (square)
  - Center-aligned content
  - Icon at top (32dp size)
  - Number (48dp font, bold)
  - Status label (14dp font, medium)
  - Subtle background colors matching status
  - Tap to filter work orders by status
  - Ripple effect on tap

**Status Colors (Light Theme):**
- Unassigned: Light gray (#F5F5F5)
- Assigned: Light blue (#E3F2FD)
- Paused: Light purple (#F3E5F5)
- Completed: Light green (#E8F5E9)

#### C. Work Orders List Section
**Tabbed Interface:**
```
[Unassigned] [Assigned] [In Progress] [Paused] [Completed]
     ^
   (default selected)
```

**List Item Card:**
```
┌─────────────────────────────────────────┐
│ WO-20250909-0003              [Priority]│
│ Hydraulic valve not responding          │
│                                         │
│ 📍 Chicago    🕐 2 hours ago    [Status]│
│                                         │
│ ┌──────────┐  ┌──────────┐            │
│ │  Assign  │  │  Details │            │
│ └──────────┘  └──────────┘            │
└─────────────────────────────────────────┘
```

**Specifications:**
- Horizontal scrollable tabs at top
- Each card:
  - 16dp margins (8dp vertical gap between cards)
  - Rounded corners: 8dp
  - Elevation: 2
  - Left accent bar (3dp) - color by priority
  - WO number + Priority badge (right aligned)
  - Description (max 2 lines)
  - Metadata row: Location + Time + Status badge
  - Action buttons row (context-aware based on status)
  - Swipeable for quick actions

**Priority Colors:**
- High: Red (#D32F2F)
- Medium: Orange (#F57C00)
- Low: Blue (#1976D2)

---

## 2. DOCUMENTS SCREEN

### Layout Structure
```
AppBar
  ├─ Hamburger Menu
  ├─ "Documents" title
  └─ Search icon

Content Area:
  ├─ Filter Chips Row (horizontal scroll)
  │   [All] [Images] [PDFs] [Reports] [Recent]
  │
  ├─ Current Work Order Section (if active WO)
  │   └─ "WO-XXX Documents" header + count
  │
  └─ Document Grid (2 columns)
      ├─ Document Card 1
      ├─ Document Card 2
      └─ ...
```

### Document Card Design (2-Column Grid)
```
┌───────────────────┐
│                   │
│   [File Icon]     │
│   or Thumbnail    │
│                   │
├───────────────────┤
│ filename.pdf      │
│ 2.4 MB • 2h ago   │
│                   │
│ ┌──────┐ ┌──────┐│
│ │ View │ │ Share││
│ └──────┘ └──────┘│
└───────────────────┘
```

**Specifications:**
- 2 columns with equal width
- 8dp gap between cards
- 12dp horizontal margins
- Each card:
  - Aspect ratio: 3:4
  - Thumbnail/icon area (60% of card height)
  - File info section
  - Action buttons at bottom
  - Rounded corners: 8dp
  - Elevation: 2
  - Long press for additional options

**File Type Icons:**
- PDF: Red icon
- Images: Blue icon
- Excel/CSV: Green icon
- Word: Blue icon
- Generic: Gray icon

---

## 3. PARTS SCREEN

### Layout Structure
```
AppBar
  ├─ Hamburger Menu
  ├─ "Parts" title
  ├─ Search icon
  └─ Filter icon

Content Area:
  ├─ Quick Stats Bar
  │   [Total: 245] [In Stock: 198] [Low Stock: 12]
  │
  ├─ Category Tabs (horizontal scroll)
  │   [All] [Electrical] [Hydraulic] [Mechanical] [Tools]
  │
  └─ Parts List
      ├─ Part Card 1
      ├─ Part Card 2
      └─ ...
```

### Part Card Design (List View)
```
┌─────────────────────────────────────────┐
│ [Image]  Part #: HD-9821-V4             │
│          Hydraulic Valve Assembly       │
│          ────────────────────           │
│          📦 In Stock: 12                │
│          📍 Warehouse B, Bin A-42       │
│                                         │
│          ┌────────┐  ┌────────┐        │
│          │ Reserve│  │ Details│        │
│          └────────┘  └────────┘        │
└─────────────────────────────────────────┘
```

**Specifications:**
- List view with left-aligned thumbnail
- Each card:
  - 16dp horizontal margins
  - 8dp vertical gap
  - Left: Square thumbnail (80x80dp)
  - Right: Part details
  - Part number (bold, 16dp)
  - Description (regular, 14dp, max 2 lines)
  - Stock status with icon
  - Location info
  - Action buttons at bottom-right
  - Rounded corners: 8dp
  - Elevation: 2

**Stock Status Indicators:**
- In Stock (>10): Green badge
- Low Stock (1-10): Orange badge
- Out of Stock (0): Red badge

---

## 4. PROFILE SCREEN

### Layout Structure
```
[Header Section with Avatar & Name]
  ├─ Profile Photo (center, 80dp)
  ├─ Name (24dp, bold)
  ├─ Role: Field Service Engineer
  └─ Employee ID

[Statistics Cards Row]
  ┌──────────┐ ┌──────────┐ ┌──────────┐
  │    24    │ │    18    │ │   95%    │
  │Completed │ │  Active  │ │ On-Time  │
  └──────────┘ └──────────┘ └──────────┘

[Settings List]
  ├─ Personal Information
  ├─ Notifications
  ├─ Language & Region
  ├─ Offline Settings
  ├─ About App
  └─ Logout
```

**Specifications:**
- Header: Gradient background (teal theme), white text
- Avatar: Circular, 80dp, centered
- Stats cards: 3 equal-width columns, rounded corners
- Settings list: Material Design list items with icons
- Dividers between sections
- Logout button: Red text, bottom of list

---

## 5. CALENDAR SCREEN (Coming Soon)

### Implementation
```dart
// In navigation setup
if (index == 1) { // Calendar tab
  return Scaffold(
    appBar: AppBar(title: Text('Calendar')),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.calendar_today, size: 64, color: Colors.grey),
          SizedBox(height: 16),
          Text(
            'Coming Soon',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            'Calendar feature is under development',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    ),
  );
}
```

**DI Configuration:**
```dart
// Comment out in dependency injection setup
// Future<void> _setupDependencies() async {
//   // Calendar-related services
//   // getIt.registerLazySingleton<CalendarService>(() => CalendarService());
//   // getIt.registerFactory<CalendarBloc>(() => CalendarBloc());
// }
```

---

## 🎨 Design System & Shared Widgets

### Color Palette (Teal/Green Theme)
```dart
class AppColors {
  // Primary Colors
  static const primary = Color(0xFF00897B); // Teal
  static const primaryDark = Color(0xFF00695C);
  static const primaryLight = Color(0xFF4DB6AC);
  static const accent = Color(0xFF66BB6A); // Green
  
  // Status Colors
  static const success = Color(0xFF4CAF50);
  static const warning = Color(0xFFFFA726);
  static const error = Color(0xFFEF5350);
  static const info = Color(0xFF42A5F5);
  
  // Neutral Colors
  static const background = Color(0xFFF5F5F5);
  static const surface = Colors.white;
  static const textPrimary = Color(0xFF212121);
  static const textSecondary = Color(0xFF757575);
  static const divider = Color(0xFFBDBDBD);
  
  // Priority Colors
  static const priorityHigh = Color(0xFFD32F2F);
  static const priorityMedium = Color(0xFFF57C00);
  static const priorityLow = Color(0xFF1976D2);
}
```

### Typography
```dart
class AppTextStyles {
  static const headline1 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );
  
  static const headline2 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );
  
  static const subtitle1 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );
  
  static const body1 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.textPrimary,
  );
  
  static const caption = TextStyle(
    fontSize: 12,
    color: AppColors.textSecondary,
  );
}
```

### Spacing System
```dart
class AppSpacing {
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 12.0;
  static const double lg = 16.0;
  static const double xl = 24.0;
  static const double xxl = 32.0;
}
```

### Border Radius
```dart
class AppBorderRadius {
  static const small = BorderRadius.all(Radius.circular(4));
  static const medium = BorderRadius.all(Radius.circular(8));
  static const large = BorderRadius.all(Radius.circular(12));
  static const extraLarge = BorderRadius.all(Radius.circular(16));
}
```

---

## 🧩 Shared Widget Library

### 1. StatusBadge Widget
```dart
class StatusBadge extends StatelessWidget {
  final String status;
  final bool isCompact;
  
  // Auto-assigns color based on status
  // Returns a chip/badge with appropriate styling
}
```

### 2. PriorityIndicator Widget
```dart
class PriorityIndicator extends StatelessWidget {
  final String priority; // 'high', 'medium', 'low'
  final IndicatorType type; // badge, bar, dot
  
  // Visual indicator for work order priority
}
```

### 3. WorkOrderCard Widget
```dart
class WorkOrderCard extends StatelessWidget {
  final WorkOrder workOrder;
  final List<WorkOrderAction> actions;
  final VoidCallback onTap;
  final bool isExpanded;
  
  // Reusable WO card with consistent styling
  // Supports quick actions, priority indicators
}
```

### 4. EmptyState Widget
```dart
class EmptyState extends StatelessWidget {
  final IconData icon;
  final String title;
  final String message;
  final Widget? action;
  
  // Consistent empty state across all screens
}
```

### 5. AppCard Widget
```dart
class AppCard extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final double? elevation;
  
  // Base card component with consistent styling
}
```

### 6. QuickActionButton Widget
```dart
class QuickActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;
  final Color? color;
  
  // Standardized action buttons for cards
}
```

### 7. OfflineBanner Widget
```dart
class OfflineBanner extends StatelessWidget {
  final bool isOffline;
  final VoidCallback? onSync;
  
  // Banner showing offline status
  // Auto-hides when online
  // Shows sync status when syncing
}
```

### 8. SectionHeader Widget
```dart
class SectionHeader extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Widget? trailing;
  
  // Consistent section headers throughout app
}
```

### 9. StatCard Widget
```dart
class StatCard extends StatelessWidget {
  final String value;
  final String label;
  final IconData? icon;
  final Color? color;
  
  // Statistics display card (for dashboard & profile)
}
```

### 10. MetadataRow Widget
```dart
class MetadataRow extends StatelessWidget {
  final List<MetadataItem> items;
  
  // Displays icon + text pairs in a row
  // Auto-spacing, overflow handling
}
```

---

## 🎯 Navigation Drawer Design

### Drawer Structure
```
┌─────────────────────────────────┐
│ [Header Section]                │
│   Profile Photo                 │
│   Engineer Name                 │
│   employee@company.com          │
├─────────────────────────────────┤
│ QUICK ACTIONS                   │
│ ├─ 🔄 Sync Now                  │
│ ├─ 📸 Scan QR Code              │
│ └─ 📍 Check In                  │
├─────────────────────────────────┤
│ NAVIGATION                      │
│ ├─ 🏠 Dashboard                 │
│ ├─ 📄 Documents                 │
│ ├─ 🔧 Parts                     │
│ └─ 👤 Profile                   │
├─────────────────────────────────┤
│ SETTINGS                        │
│ ├─ ⚙️ App Settings              │
│ ├─ 🔔 Notifications             │
│ ├─ 🌐 Language                  │
│ └─ ℹ️ About                     │
├─────────────────────────────────┤
│ 🚪 Logout                       │
└─────────────────────────────────┘
```

**Specifications:**
- Width: 80% of screen width (max 300dp)
- Header: Gradient background (teal theme)
- Section dividers with labels
- Icons for all items
- Highlight current screen
- Smooth slide-in animation

---

## 🤖 AI Chatbot FAB & Screen

### FAB Design
```dart
FloatingActionButton.extended(
  onPressed: () => Navigator.pushNamed(context, '/chatbot'),
  icon: Icon(Icons.smart_toy),
  label: Text('AI Assistant'),
  backgroundColor: AppColors.accent,
)
```

**Position:** Bottom-right corner, 16dp from edges
**Behavior:** 
- Expands to show "AI Assistant" label on dashboard
- Collapses to icon-only on scroll
- Elevation: 6

### Chatbot Screen (Placeholder)
```
AppBar: "AI Assistant"

Body:
  ├─ [Chat Interface Placeholder]
  │   Center(
  │     Icon: Robot/AI
  │     Text: "AI Assistant"
  │     Subtitle: "Coming Soon"
  │     Description: "Get instant help with work orders,
  │                   parts lookup, and troubleshooting"
  │   )
  │
  └─ [Suggested Actions Cards]
      ├─ "Find a part"
      ├─ "Troubleshoot issue"
      └─ "Schedule follow-up"
```

---

## 📐 Layout Guidelines

### Screen Padding & Margins
- Screen horizontal padding: 16dp
- Card horizontal margins: 16dp
- Card vertical spacing: 8dp
- Content padding inside cards: 12dp
- Bottom navigation padding: 8dp

### Grid Layouts
- 2-column grid gap: 8dp
- 3-column grid gap: 6dp
- Maintain equal heights in rows

### Elevation System
- Level 0: Background
- Level 1 (2dp): Most cards
- Level 2 (4dp): Current WO card, important items
- Level 3 (6dp): FAB
- Level 4 (8dp): AppBar, Bottom Nav

### Touch Targets
- Minimum: 48x48dp
- Button height: 48dp
- Icon buttons: 48x48dp
- List items: min 56dp height

---

## 🔄 State Management & Data Flow

### Work Order Status Update Flow
```
1. User taps "Pause" on WO card
2. Show confirmation dialog
3. On confirm:
   - Update local state
   - Show loading indicator
   - Call API
   - Update UI immediately (optimistic)
   - If offline: Queue for sync
   - Show success snackbar
4. On error:
   - Revert UI
   - Show error message
   - Offer retry option
```

### Offline Mode Behavior
- **On connection loss:**
  - Show offline banner at top of scaffold
  - Switch sync icon in AppBar to red
  - Show "Offline" badge next to work order cards
  
- **User actions while offline:**
  - Queue all updates locally
  - Show "Saved locally - will sync" message
  - Display pending sync count in drawer
  
- **On connection restore:**
  - Auto-sync queued changes
  - Show sync progress
  - Hide offline banner
  - Show "Synced successfully" message

### Self-Assignment Flow
```
Unassigned Tab → WO Card → "Assign to Me" button
  ↓
Confirmation Dialog: "Assign WO-XXX to yourself?"
  ↓
[Confirm] → 
  - Move to "Assigned" status
  - Refresh dashboard
  - Show in "My Work Orders"
  - Send notification
```

---

## 🎨 Animation Guidelines

### Transitions
- Screen transitions: 300ms ease-in-out
- Card expand/collapse: 250ms ease
- FAB appearance: 200ms scale + fade
- Drawer slide: 250ms ease-out
- Tab switching: 200ms fade

### Micro-interactions
- Button press: Ripple effect (Material)
- Card tap: Scale 0.98 + elevation change
- Success action: Check mark animation
- Loading: Circular progress indicator
- Pull-to-refresh: Material refresh indicator

### List Animations
- Item insertion: Fade + slide from top (150ms)
- Item removal: Fade + slide to left (150ms)
- List scroll: Smooth scrolling physics
- Reorder: Drag with elevation increase

---

## 📱 Responsive Design

### Breakpoints
- Small phone: < 360dp width
- Normal phone: 360-400dp width
- Large phone: > 400dp width
- Tablet: > 600dp width

### Adaptations
**Dashboard Cards:**
- Small: 2x2 grid (4 cards)
- Normal: 2x2 grid (4 cards)
- Large: 2x3 grid (6 cards) - add more stats
- Tablet: 3x2 grid (6 cards)

**Document Grid:**
- Small: 2 columns
- Normal: 2 columns
- Large: 3 columns
- Tablet: 4 columns

**Parts List:**
- Always list view on phones
- Grid view option on tablets

---

## ♿ Accessibility

### Requirements
- All interactive elements: min 48x48dp
- Color contrast ratio: minimum 4.5:1
- Support for screen readers
- Semantic labels for icons
- Focus indicators for keyboard navigation
- Support for larger text sizes (up to 200%)

### Implementation
```dart
// Example: Accessible button
Semantics(
  label: 'Assign work order to yourself',
  button: true,
  child: QuickActionButton(
    icon: Icons.person_add,
    label: 'Assign',
    onPressed: _handleAssign,
  ),
)
```

---

## 🧪 Testing Checklist

### Visual Consistency
- [ ] All cards have consistent corner radius
- [ ] Spacing is uniform across screens
- [ ] Colors match design system
- [ ] Typography is consistent
- [ ] Icons are same size in similar contexts

### Functionality
- [ ] Work order status updates correctly
- [ ] Navigation works from all entry points
- [ ] Drawer opens/closes smoothly
- [ ] FAB navigates to chatbot screen
- [ ] Search filters content properly
- [ ] Offline banner appears/disappears correctly

### Edge Cases
- [ ] Empty states display correctly
- [ ] Long text truncates with ellipsis
- [ ] Large lists scroll smoothly
- [ ] Low/no connectivity handled gracefully
- [ ] Rapid taps don't cause issues

### Devices
- [ ] Tested on small phone (e.g., iPhone SE)
- [ ] Tested on normal phone (e.g., Pixel 5)
- [ ] Tested on large phone (e.g., iPhone Pro Max)
- [ ] Both portrait and landscape orientations

---

## 📦 Implementation Structure

### File Organization
```
lib/
├── core/
│   ├── theme/
│   │   ├── app_colors.dart
│   │   ├── app_text_styles.dart
│   │   ├── app_theme.dart
│   │   └── app_dimensions.dart
│   └── widgets/
│       ├── app_card.dart
│       ├── status_badge.dart
│       ├── priority_indicator.dart
│       ├── empty_state.dart
│       ├── offline_banner.dart
│       ├── section_header.dart
│       ├── stat_card.dart
│       ├── metadata_row.dart
│       └── quick_action_button.dart
│
├── features/
│   ├── dashboard/
│   │   ├── widgets/
│   │   │   ├── current_wo_card.dart
│   │   │   ├── status_summary_grid.dart
│   │   │   ├── work_order_card.dart
│   │   │   └── work_order_list.dart
│   │   └── dashboard_screen.dart
│   │
│   ├── documents/
│   │   ├── widgets/
│   │   │   ├── document_card.dart
│   │   │   └── document_grid.dart
│   │   └── documents_screen.dart
│   │
│   ├── parts/
│   │   ├── widgets/
│   │   │   ├── part_card.dart
│   │   │   ├── quick_stats_bar.dart
│   │   │   └── category_tabs.dart
│   │   └── parts_screen.dart
│   │
│   ├── profile/
│   │   ├── widgets/
│   │   │   ├── profile_header.dart
│   │   │   ├── stats_row.dart
│   │   │   └── settings_list.dart
│   │   └── profile_screen.dart
│   │
│   ├── chatbot/
│   │   └── chatbot_screen.dart (placeholder)
│   │
│   └── calendar/
│       └── calendar_screen.dart (coming soon)
│
├── navigation/
│   ├── app_drawer.dart
│   ├── bottom_navigation.dart
│   └── app_router.dart
│
└── main.dart
```

---

## 🎯 Implementation Priority

### Phase 1: Foundation (Week 1)
1. Set up design system (colors, typography, spacing)
2. Create shared widget library
3. Build app scaffold with drawer & bottom nav
4. Implement offline banner

### Phase 2: Dashboard (Week 2)
1. Status summary grid (2x2)
2. Current WO card with quick actions
3. Work order list with tabs
4. Self-assignment flow

### Phase 3: Secondary Screens (Week 3)
1. Documents screen with grid layout
2. Parts screen with list view
3. Profile screen with stats
4. Calendar "Coming Soon" placeholder

### Phase 4: Polish (Week 4)
1. AI Chatbot FAB and placeholder screen
2. Animations and transitions
3. Accessibility improvements
4. Testing and bug fixes

---

## 🔍 Key User Flows

### 1. Self-Assign Work Order
```
Dashboard → Unassigned Tab → Select WO Card → 
"Assign to Me" Button → Confirmation Dialog → 
Confirm → WO moves to "Assigned" → 
Appears in "My Work Orders"
```

### 2. Update Work Order Status
```
Dashboard → Current WO Card → 
Select Quick Action (Pause/Complete) → 
Confirmation Dialog → Confirm → 
Status updates → Card moves to appropriate section → 
Success message
```

### 3. Access Documents for Current WO
```
Dashboard → Current WO Card → "Docs" Button → 
Documents Screen (filtered to current WO) → 
Select document → View/Share options
```

### 4. Reserve a Part
```
Bottom Nav → Parts → Search/Browse → 
Select Part Card → "Reserve" Button → 
Enter quantity → Confirm → 
Part reserved → Confirmation message
```

### 5. Use AI Assistant (Future)
```
Any Screen → AI Chatbot FAB → 
Chatbot Screen → Type query → 
Get response with actionable suggestions
```

---

## 🎨 Visual Examples & Mockup Notes

### Current WO Card (IN PROGRESS)
- **Visual Weight:** Heaviest element on dashboard
- **Position:** Above status grid
- **Purpose:** Immediate focus on active work
- **Interactions:** 4 quick action buttons
- **Feedback:** Haptic on button press

### Status Summary Grid
- **Symmetry:** Perfect 2x2 grid
- **Equal Heights:** All cards same size
- **Color Coding:** Subtle background colors
- **Numbers:** Large, bold, center-aligned
- **Tap Behavior:** Filter work orders list below

### Work Order Cards in List
- **Density:** Comfortable spacing (8dp gaps)
- **Scannability:** Priority bar on left, badges on right
- **Actions:** Context-aware buttons
- **States:** Default, Active, Overdue (visual indicators)

### Drawer
- **Width:** 280dp (comfortable for one-hand use)
- **Sections:** Visually separated with labels
- **Current Screen:** Highlighted in primary color
- **Quick Actions:** First section for frequency

---

## 🚀 Performance Optimizations

1. **Lazy Loading:** Load WO lists in batches (20 items)
2. **Image Caching:** Cache document thumbnails locally
3. **State Management:** Use efficient state management (Bloc/Riverpod)
4. **Debounce Search:** Wait 300ms after typing stops
5. **Optimize Rebuilds:** Use const widgets where possible
6. **Memory:** Dispose controllers properly
7. **Network:** Cache API responses (5 min TTL)

---

## 📋 Additional Notes

### Design Philosophy
- **Less is More:** Remove unnecessary elements
- **Hierarchy:** Guide user's eye to important info
- **Consistency:** Reuse components everywhere
- **Feedback:** Confirm every user action
- **Forgiveness:** Allow undo for destructive actions

### FSE-Centric Design
- **Speed:** Quick access to common actions
- **Context:** Show relevant info at right time
- **Offline-First:** Work without connectivity
- **Minimal Input:** Reduce typing with smart defaults
- **Glanceable:** Understand status at a glance

### Future Enhancements
- Biometric authentication
- Dark mode support
- Voice commands for hands-free operation
- Augmented reality for parts identification
- Predictive maintenance insights

---

## ✅ Definition of Done

A screen is considered complete when:
- [ ] Matches design specifications exactly
- [ ] Uses only shared widgets from library
- [ ] Responsive on all phone sizes
- [ ] Accessible (screen reader tested)
- [ ] Handles loading, error, empty states
- [ ] Animations are smooth (60fps)
- [ ] Works offline with proper indicators
- [ ] Has proper error handling
- [ ] Code is documented
- [ ] Passes all tests

---

## 🎯 Success Metrics

After implementation, measure:
- Time to complete common tasks (should decrease by 30%)
- User satisfaction scores (target: 4.5+/5)
- Error rate (should decrease by 40%)
- App crashes (should be < 0.1%)
- User retention (should increase by 20%)

---

## 📞 Support & Questions

When implementing:
1. Follow design system strictly
2. Reuse shared widgets always
3. Test on real devices
4. Get feedback from FSEs early
5. Iterate based on usage patterns

---

**END OF DESIGN SPECIFICATION**

This comprehensive specification provides everything needed to rebuild the FSM app with a focus on symmetry, shared components, and field engineer workflows. All design decisions are based on real-world FSE requirements and modern mobile UX best practices.
