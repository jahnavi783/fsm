# FSM App Complete UI/UX Redesign Implementation Plan

## Overview
Progressive replacement of FSM app UI following the redesign specification, with full Teal/Green color system update, refactored BLoCs, and new navigation structure.

**Approved**: January 2025
**Implementation Approach**: Progressive Replacement
**Theme**: Full Teal/Green Color System Update
**Architecture**: Refactor BLoCs to match new UI structure

---

## PHASE 1: FOUNDATION (Design System + Navigation)

### 1.1 Color System Update (AppColors)
**File**: `lib/core/theme/app_colors.dart`

- **Replace Primary Colors**:
  - Primary: `#116587` → `#00897B` (Teal)
  - Primary Dark: Add `#00695C`
  - Primary Light: Add `#4DB6AC`
  - Accent: `#00A74F` → `#66BB6A` (Green)

- **Update Status Colors**:
  - Unassigned: `#F5F5F5` (Light gray)
  - Assigned: `#E3F2FD` (Light blue)
  - In Progress: Keep `#FF9800` (Orange)
  - Paused: `#F3E5F5` (Light purple)
  - Completed: `#E8F5E9` (Light green)

- **Update Priority Colors**:
  - High: `#D32F2F` (Red)
  - Medium: `#F57C00` (Orange)
  - Low: `#1976D2` (Blue)

- **Update Semantic Colors**:
  - Success: `#4CAF50`
  - Warning: `#FFA726`
  - Error: `#EF5350`
  - Info: `#42A5F5`

### 1.2 Verify/Update AppDimensions
**File**: `lib/core/theme/app_dimensions.dart`

- Verify spacing matches spec: 4w, 8w, 12w, 16w, 24w, 32w
- Verify border radius: 4r, 8r, 12r, 16r
- Ensure elevation system: 0, 2, 4, 6, 8

### 1.3 Update Theme Extension
**File**: `lib/core/theme/extensions/fsm_theme_extension.dart`

- Update gradient to use new primary/accent colors
- Update status color maps
- Add new "Paused" status color
- Add "Unassigned" status color

### 1.4 Create New Shared Widgets

**Create**: `lib/core/widgets/priority_indicator.dart`
- Visual indicator for work order priority (badge, bar, dot types)
- Uses new priority colors

**Create**: `lib/core/widgets/quick_action_button.dart`
- Standardized action buttons for cards
- Icon + label layout
- Supports custom colors

**Create**: `lib/core/widgets/metadata_row.dart`
- Displays icon + text pairs in a row
- Auto-spacing, overflow handling
- Used for location, time, status info

**Update**: `lib/core/widgets/status_badge.dart`
- Add "Paused" status variant
- Add "Unassigned" status variant
- Update colors to match new theme

**Update**: `lib/core/widgets/offline_banner.dart`
- Change to amber/yellow theme
- Make dismissible
- Update message: "You're offline. Changes will sync when connected."

### 1.5 Create Navigation Drawer
**Create**: `lib/core/widgets/fsm_drawer.dart`

Structure:
```
- Header Section (Gradient teal background)
  - Profile photo (80dp, circular)
  - Engineer name
  - Email
  - Employee ID

- Quick Actions Section
  - Sync Now
  - Scan QR Code
  - Check In

- Navigation Section
  - Dashboard
  - Documents
  - Parts
  - Profile

- Settings Section
  - App Settings
  - Notifications
  - Language
  - About

- Logout (red text)
```

Specifications:
- Width: 80% of screen (max 300dp)
- Gradient header with teal theme
- Highlight current screen
- Smooth slide-in animation (250ms)

### 1.6 Update Bottom Navigation
**Update**: `lib/features/main_navigation/presentation/pages/main_navigation_page.dart`

Changes:
- Remove Calendar tab from active tabs (5 → 4 tabs)
- Update tab order: Dashboard, Documents, Parts, Profile
- Update NavigationBloc to handle 4-tab structure
- Keep Calendar route but show "Coming Soon" page

**Update**: `lib/features/main_navigation/presentation/blocs/navigation_bloc.dart`
- Update events/states for 4-tab navigation
- Add event for drawer toggle
- Add state for current drawer selection

### 1.7 Simplify FSMAppBar
**Update**: `lib/core/widgets/fsm_app_bar.dart`

Keep only:
- Hamburger menu icon (left) - opens drawer
- App title/logo (center)
- Search icon (right) - context-aware
- Refresh/Sync icon (right, only when offline)

Remove:
- Settings button (move to drawer)
- Excessive action buttons

### 1.8 Implement AI Chatbot FAB
**Create**: `lib/core/widgets/ai_chatbot_fab.dart`

- Position: Bottom-right, 16dp from edges
- Extended FAB with icon + "AI Assistant" label
- Accent color background (#66BB6A)
- Elevation: 6
- Behavior: Expands on dashboard, collapses to icon on scroll
- Navigates to: `/chatbot`

---

## PHASE 2: DASHBOARD REDESIGN

### 2.1 Create Current Work Order Card Widget
**Create**: `lib/features/work_orders/presentation/widgets/current_wo_card.dart`

Features:
- Full-width with 16dp margins
- Elevated shadow (elevation: 4)
- Left border accent (4dp, orange/amber)
- Top: Status badge + WO number + Priority indicator
- Middle: Issue description (max 2 lines, ellipsis)
- Bottom: Location + Time metadata row
- Quick Actions: Pause, Parts, Docs, Complete buttons
- Rounded corners: 12dp

### 2.2 Create Status Summary Grid Widget
**Create**: `lib/features/work_orders/presentation/widgets/status_summary_grid.dart`

Layout: 2x2 grid (4 cards total)
Cards:
1. Unassigned (light gray background)
2. Assigned (light blue background)
3. Paused (light purple background)
4. Completed (light green background)

Specifications:
- Equal height (1:1 aspect ratio - square)
- 12dp gap between cards
- 16dp horizontal margins
- Icon (32dp) + Number (48dp bold) + Label (14dp)
- Center-aligned content
- Tap to filter work orders list
- Ripple effect on tap

### 2.3 Create Work Order List Widget with Tabs
**Create**: `lib/features/work_orders/presentation/widgets/work_order_list_tabs.dart`

Tabs: Unassigned, Assigned, In Progress, Paused, Completed

**Create**: `lib/features/work_orders/presentation/widgets/work_order_list_card.dart`

List Card Layout:
- 16dp margins, 8dp vertical gap
- Rounded corners: 8dp
- Elevation: 2
- Left accent bar (3dp) - color by priority
- WO number + Priority badge (right)
- Description (max 2 lines)
- Metadata row: Location + Time + Status badge
- Action buttons row (context-aware: Assign, Details, Start, etc.)
- Swipeable for quick actions

### 2.4 Update Dashboard Page
**Update**: `lib/features/work_orders/presentation/pages/dashboard_page.dart`

New Layout:
```
AppBar (simplified with hamburger menu)
  ↓
[Offline Banner] - Only when offline
  ↓
[Current Work Order Card] - If FSE has WO in progress
  ↓
[Status Summary Grid] - 2x2 layout
  ↓
[Work Orders List] - Tabbed interface
```

### 2.5 Refactor DashboardBloc
**Update**: `lib/features/work_orders/presentation/blocs/dashboard_bloc.dart`

New Events:
- `LoadDashboard` - Load all dashboard data
- `FilterByStatus(status)` - Filter from status grid tap
- `SelectTab(tabIndex)` - Switch between tabs
- `RefreshDashboard` - Pull-to-refresh
- `DismissOfflineBanner` - Hide offline banner

New State Properties:
- `currentWorkOrder` - Active WO for card (nullable)
- `statusCounts` - Map of status → count for grid
- `selectedTab` - Current tab index
- `filteredWorkOrders` - Work orders for current tab
- `offlineBannerDismissed` - Boolean flag

---

## PHASE 3: SECONDARY SCREENS

### 3.1 Documents Screen Redesign
**Update**: `lib/features/documents/presentation/pages/documents_page.dart`

New Layout:
```
AppBar (simplified)
  ↓
[Filter Chips Row] - All, Images, PDFs, Reports, Recent
  ↓
[Current Work Order Section] - If active WO
  "WO-XXX Documents" header + count
  ↓
[Document Grid] - 2 columns
```

**Create**: `lib/features/documents/presentation/widgets/document_grid_card.dart`

Card Specifications:
- 2 columns, equal width
- 8dp gap between cards
- 12dp horizontal margins
- Aspect ratio: 3:4
- Thumbnail/icon area (60% height)
- File info: name, size, time
- Action buttons: View, Share
- Rounded corners: 8dp
- Elevation: 2

**Update**: `lib/features/documents/presentation/blocs/documents_bloc.dart`

New Events:
- `FilterByType(type)` - Filter by file type chip
- `LoadCurrentWODocuments(woId)` - Load docs for active WO

New State Properties:
- `selectedFilter` - Current filter chip
- `currentWODocuments` - Docs for active WO (nullable)

### 3.2 Parts Screen Redesign
**Update**: `lib/features/parts/presentation/pages/parts_page.dart`

New Layout:
```
AppBar (simplified with search + filter)
  ↓
[Quick Stats Bar] - Total, In Stock, Low Stock
  ↓
[Category Tabs] - All, Electrical, Hydraulic, Mechanical, Tools
  ↓
[Parts List] - List view with thumbnails
```

**Create**: `lib/features/parts/presentation/widgets/quick_stats_bar.dart`
- 3 stat chips: Total, In Stock, Low Stock
- Horizontal layout with dividers

**Create**: `lib/features/parts/presentation/widgets/part_list_card.dart`

Card Layout:
- List view with left-aligned thumbnail (80x80dp)
- Part number (bold, 16dp)
- Description (regular, 14dp, max 2 lines)
- Stock status with icon (color-coded)
- Location info
- Action buttons: Reserve, Details (bottom-right)
- 16dp horizontal margins, 8dp vertical gap
- Rounded corners: 8dp, Elevation: 2

**Update**: `lib/features/parts/presentation/blocs/parts_bloc.dart`

New Events:
- `SelectCategory(category)` - Switch category tab
- `LoadQuickStats` - Load total/in stock/low stock counts

New State Properties:
- `selectedCategory` - Current category tab
- `quickStats` - Total, inStock, lowStock counts

### 3.3 Profile Screen Redesign
**Update**: `lib/features/profile/presentation/pages/profile_page.dart`

New Layout:
```
[Header Section - Gradient teal background]
  - Profile photo (80dp, circular, centered)
  - Name (24dp, bold)
  - Role: Field Service Engineer
  - Employee ID
  ↓
[Statistics Cards Row] - 3 equal-width columns
  - Completed (24)
  - Active (18)
  - On-Time (95%)
  ↓
[Settings List]
  - Personal Information
  - Notifications
  - Language & Region
  - Offline Settings
  - About App
  - Logout (red text)
```

**Create**: `lib/features/profile/presentation/widgets/profile_header.dart`
- Gradient background (teal theme)
- Avatar: 80dp, circular, centered
- White text on gradient

**Create**: `lib/features/profile/presentation/widgets/profile_stats_row.dart`
- 3 equal-width StatCards
- Completed, Active, On-Time percentage
- Rounded corners, subtle backgrounds

**Update**: `lib/features/profile/presentation/blocs/profile_bloc.dart`

New Events:
- `LoadProfileStats` - Load completed, active, on-time stats

New State Properties:
- `stats` - ProfileStats entity (completed, active, onTimePercentage)

### 3.4 Calendar "Coming Soon" Placeholder
**Update**: `lib/features/calendar/presentation/pages/calendar_page.dart`

Replace entire page with:
```dart
Scaffold(
  appBar: FSMAppBar(title: 'Calendar'),
  body: FSMEmptyState.noData(
    icon: Icons.calendar_today,
    title: 'Coming Soon',
    message: 'Calendar feature is under development',
  ),
)
```

### 3.5 AI Chatbot "Coming Soon" Placeholder
**Create**: `lib/features/chat/presentation/pages/chatbot_page.dart`

Layout:
```
AppBar: "AI Assistant"
  ↓
[Center Content]
  - Robot/AI icon (64dp)
  - "AI Assistant" title
  - "Coming Soon" subtitle
  - Description: "Get instant help with work orders, parts lookup, and troubleshooting"
  ↓
[Suggested Actions Cards]
  - "Find a part"
  - "Troubleshoot issue"
  - "Schedule follow-up"
```

**Add Route**: Update `lib/core/router/app_router.dart`
```dart
AutoRoute(page: ChatbotRoute.page, path: '/chatbot')
```

---

## IMPLEMENTATION DETAILS

### File Structure Changes

**New Files to Create**:
```
lib/core/widgets/
├── priority_indicator.dart
├── quick_action_button.dart
├── metadata_row.dart
├── fsm_drawer.dart
└── ai_chatbot_fab.dart

lib/features/work_orders/presentation/widgets/
├── current_wo_card.dart
├── status_summary_grid.dart
├── work_order_list_tabs.dart
└── work_order_list_card.dart

lib/features/documents/presentation/widgets/
└── document_grid_card.dart

lib/features/parts/presentation/widgets/
├── quick_stats_bar.dart
└── part_list_card.dart

lib/features/profile/presentation/widgets/
├── profile_header.dart
└── profile_stats_row.dart

lib/features/chat/presentation/pages/
└── chatbot_page.dart
```

**Files to Update**:
```
lib/core/theme/
├── app_colors.dart (full color system update)
└── extensions/fsm_theme_extension.dart (update color maps)

lib/core/widgets/
├── status_badge.dart (add Paused, Unassigned)
├── offline_banner.dart (amber theme, dismissible)
└── fsm_app_bar.dart (simplify actions)

lib/features/main_navigation/presentation/
├── pages/main_navigation_page.dart (4 tabs + drawer + FAB)
└── blocs/navigation_bloc.dart (4-tab events/states)

lib/features/work_orders/presentation/
├── pages/dashboard_page.dart (new layout)
└── blocs/dashboard_bloc.dart (refactor events/states)

lib/features/documents/presentation/
├── pages/documents_page.dart (2-col grid + filters)
└── blocs/documents_bloc.dart (filter events/states)

lib/features/parts/presentation/
├── pages/parts_page.dart (stats bar + categories)
└── blocs/parts_bloc.dart (category events/states)

lib/features/profile/presentation/
├── pages/profile_page.dart (header + stats + list)
└── blocs/profile_bloc.dart (stats events/states)

lib/features/calendar/presentation/
└── pages/calendar_page.dart (coming soon placeholder)

lib/core/router/
└── app_router.dart (add /chatbot route)
```

### Code Generation Requirements

After implementation, run:
```bash
dart run build_runner build --delete-conflicting-outputs
```

This generates:
- BLoC state/event classes (Freezed)
- Router configuration
- DI configuration (if adding new injectables)

### Testing Strategy

For each phase:
1. Widget tests for new shared widgets
2. BLoC tests for refactored BLoCs
3. Integration tests for navigation flows
4. Visual regression tests for redesigned screens

### Migration Notes

**Progressive Replacement Approach**:
1. Phase 1: New design system works alongside old screens
2. Phase 2: Dashboard replaced, other screens still old
3. Phase 3: All screens replaced, old implementations removed

**Feature Flags** (optional):
- Add `useNewDesign` flag in AppConfig
- Toggle between old/new implementations during development
- Remove flags after full rollout

### Accessibility Checklist

For all new components:
- [ ] Minimum 48x48dp touch targets
- [ ] 4.5:1 color contrast ratio
- [ ] Semantic labels for icons
- [ ] Screen reader support
- [ ] Focus indicators for keyboard navigation
- [ ] Support for 200% text scaling

---

## EFFORT ESTIMATION

**Phase 1**: ~2 weeks
- Color system: 1 day
- Shared widgets: 3 days
- Navigation drawer: 2 days
- Bottom nav update: 1 day
- AppBar simplification: 1 day
- FAB implementation: 1 day
- Testing & polish: 3 days

**Phase 2**: ~2 weeks
- Current WO card: 2 days
- Status grid: 2 days
- Work order list: 3 days
- Dashboard page: 2 days
- BLoC refactor: 2 days
- Testing: 3 days

**Phase 3**: ~2 weeks
- Documents screen: 3 days
- Parts screen: 3 days
- Profile screen: 2 days
- Placeholders: 1 day
- BLoC refactors: 2 days
- Testing: 3 days

**Total**: ~6 weeks for Phases 1-3

---

## SUCCESS CRITERIA

✅ All screens match redesign specification exactly
✅ Uses Teal/Green color theme throughout
✅ All shared widgets reusable and documented
✅ Responsive on all phone sizes (tested with ScreenUtil)
✅ BLoCs refactored with clean events/states
✅ Navigation flows work seamlessly (drawer + bottom nav + FAB)
✅ Offline banner appears/dismisses correctly
✅ Work order cards show appropriate quick actions
✅ All animations smooth (60fps)
✅ Accessibility requirements met
✅ Code passes `dart analyze` with no errors
✅ All tests passing

---

## NEXT STEPS AFTER PLAN APPROVAL

1. Create feature branch: `feature/ui-redesign`
2. Start with Phase 1.1: Color system update
3. Commit frequently with descriptive messages
4. Run `dart analyze` after each major change
5. Test on real devices throughout development
6. Create PR at end of each phase for review

---

**Plan Created**: January 2025
**Last Updated**: January 2025
**Status**: Approved - Ready for Implementation
