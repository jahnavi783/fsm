# FSM App UI Redesign - Implementation TODO List

**Last Updated**: January 27, 2025
**Status**: ✅ Phase 2 Complete - Starting Phase 3 (Secondary Screens)

---

## PHASE 1: FOUNDATION (Design System + Navigation)

### 1.1 Color System Update ✅ COMPLETED
- [x] Update `AppColors` primary colors (Teal #00897B)
- [x] Add primary dark (#00695C) and light (#4DB6AC)
- [x] Update accent to Green (#66BB6A)
- [x] Add Unassigned status color (#F5F5F5)
- [x] Update Assigned status color (#E3F2FD)
- [x] Update Paused status color (#F3E5F5)
- [x] Update Completed status color (#E8F5E9)
- [x] Update Priority colors (High #D32F2F, Medium #F57C00, Low #1976D2)
- [x] Update Semantic colors (Success, Warning, Error, Info)
- [x] Update gradient definitions
- [x] Update getStatusColor() helper for new statuses
- [x] Added getStatusTextColor() helper method

### 1.2 AppDimensions Verification ✅ COMPLETED
- [x] Verify spacing constants (4w, 8w, 12w, 16w, 24w, 32w)
- [x] Verify border radius constants (4r, 8r, 12r, 16r)
- [x] Verify elevation system (0, 2, 4, 6, 8)
- [x] All dimensions match redesign spec

### 1.3 Theme Extension Update ✅ COMPLETED
- [x] Update FSMThemeExtension gradient colors (Teal to Green)
- [x] Update status color maps (both light and dark)
- [x] Add "Paused" status to map
- [x] Add "Unassigned" status to map
- [x] Update FAB background to green accent
- [x] Update offline banner to amber/yellow

### 1.4 Shared Widgets ✅ COMPLETED
- [x] Create `priority_indicator.dart` widget
- [x] Create `quick_action_button.dart` widget
- [x] Create `metadata_row.dart` widget
- [x] Update `status_badge.dart` with Paused/Unassigned
- [x] Update `offline_banner.dart` to amber theme & dismissible

### 1.5 Navigation Drawer ✅ COMPLETED
- [x] Create `fsm_drawer.dart` base structure
- [x] Implement gradient header section
- [x] Add quick actions section
- [x] Add navigation section
- [x] Add settings section
- [x] Add logout button
- [x] Implement slide-in animation
- [x] Add current screen highlighting

### 1.6 Bottom Navigation Update ✅ COMPLETED
- [x] Update `main_navigation_page.dart` to 4 tabs
- [x] Remove Calendar from active tab list
- [x] Update tab order (Dashboard, Documents, Parts, Profile)
- [x] Update NavigationBloc events for 4-tab structure
- [x] Update NavigationBloc states for 4-tab structure
- [x] Add drawer toggle event to NavigationBloc
- [x] Add drawer state to NavigationBloc

### 1.7 FSMAppBar Simplification ✅ COMPLETED
- [x] Update FSMAppBar to show hamburger menu (left)
- [x] Keep title (center)
- [x] Keep search icon (right)
- [x] Add conditional refresh/sync icon (offline only)
- [x] Remove settings button
- [x] Remove excessive action buttons

### 1.8 AI Chatbot FAB ✅ COMPLETED
- [x] Create `ai_chatbot_fab.dart` widget
- [x] Implement extended FAB design
- [x] Add accent color background
- [x] Implement expand/collapse on scroll behavior
- [x] Add navigation to /chatbot route

---

## PHASE 2: DASHBOARD REDESIGN

### 2.1 Current Work Order Card ✅ COMPLETED
- [x] Create `current_wo_card.dart` widget
- [x] Implement full-width layout with margins
- [x] Add elevated shadow (elevation: 4)
- [x] Add left border accent (4dp, orange/amber)
- [x] Add status badge + WO number + priority indicator
- [x] Add issue description (max 2 lines)
- [x] Add metadata row (location + time)
- [x] Add quick action buttons (Pause, Parts, Docs, Complete)
- [x] Add rounded corners (12dp)

### 2.2 Status Summary Grid ✅ COMPLETED
- [x] Create `status_summary_grid.dart` widget
- [x] Implement 2x2 grid layout
- [x] Create Unassigned card (light gray)
- [x] Create Assigned card (light blue)
- [x] Create Paused card (light purple)
- [x] Create Completed card (light green)
- [x] Implement equal height (1:1 aspect ratio)
- [x] Add 12dp gap between cards
- [x] Add icon + number + label layout
- [x] Implement tap to filter functionality
- [x] Add ripple effect on tap

### 2.3 Work Order List ✅ COMPLETED
- [x] Create `work_order_list_tabs.dart` widget
- [x] Add tabs (Unassigned, Assigned, In Progress, Paused, Completed)
- [x] Create `work_order_list_card.dart` widget
- [x] Add left accent bar (3dp, priority color)
- [x] Add WO number + priority badge
- [x] Add description (max 2 lines)
- [x] Add metadata row (location + time + status)
- [x] Add context-aware action buttons
- [x] Implement swipe for quick actions

### 2.4 Dashboard Page Update ✅ COMPLETED
- [x] Update `dashboard_page.dart` layout
- [x] Add simplified AppBar with hamburger menu
- [x] Add offline banner (conditional)
- [x] Add current WO card (conditional)
- [x] Add status summary grid
- [x] Add work orders list with tabs

### 2.5 DashboardBloc Refactor ✅ COMPLETED
- [x] Add LoadDashboard event
- [x] Add FilterByStatus(status) event
- [x] Add SelectTab(tabIndex) event
- [x] Add RefreshDashboard event
- [x] Add DismissOfflineBanner event
- [x] Add currentWorkOrder to state
- [x] Add statusCounts to state
- [x] Add selectedTab to state
- [x] Add filteredWorkOrders to state
- [x] Add offlineBannerDismissed to state
- [x] Implement event handlers
- [x] Run build_runner for code generation

### 2.6 Dashboard Default Tab Configuration ✅ COMPLETED
- [x] Set Assigned tab (index 1) as default instead of Unassigned
- [x] Update TabController initialization in dashboard_page.dart

---

## PHASE 3: SECONDARY SCREENS

### 3.1 Documents Screen
- [ ] Create `document_grid_card.dart` widget
- [ ] Implement 2-column grid layout
- [ ] Add 3:4 aspect ratio
- [ ] Add thumbnail/icon area (60% height)
- [ ] Add file info section
- [ ] Add action buttons (View, Share)
- [ ] Update `documents_page.dart` layout
- [ ] Add filter chips row (All, Images, PDFs, Reports, Recent)
- [ ] Add current WO section (conditional)
- [ ] Update DocumentsBloc with FilterByType event
- [ ] Update DocumentsBloc with LoadCurrentWODocuments event
- [ ] Add selectedFilter to state
- [ ] Add currentWODocuments to state

### 3.2 Parts Screen
- [ ] Create `quick_stats_bar.dart` widget
- [ ] Add 3 stat chips (Total, In Stock, Low Stock)
- [ ] Create `part_list_card.dart` widget
- [ ] Add left-aligned thumbnail (80x80dp)
- [ ] Add part number + description
- [ ] Add stock status with icon
- [ ] Add location info
- [ ] Add action buttons (Reserve, Details)
- [ ] Update `parts_page.dart` layout
- [ ] Add quick stats bar
- [ ] Add category tabs (All, Electrical, Hydraulic, Mechanical, Tools)
- [ ] Update PartsBloc with SelectCategory event
- [ ] Update PartsBloc with LoadQuickStats event
- [ ] Add selectedCategory to state
- [ ] Add quickStats to state

### 3.3 Profile Screen
- [ ] Create `profile_header.dart` widget
- [ ] Add gradient teal background
- [ ] Add circular avatar (80dp, centered)
- [ ] Add name + role + employee ID
- [ ] Create `profile_stats_row.dart` widget
- [ ] Add 3 equal-width stat cards (Completed, Active, On-Time)
- [ ] Update `profile_page.dart` layout
- [ ] Add header section
- [ ] Add stats row
- [ ] Add settings list
- [ ] Update ProfileBloc with LoadProfileStats event
- [ ] Add stats to state (completed, active, onTimePercentage)

### 3.4 Calendar Placeholder
- [ ] Update `calendar_page.dart` to "Coming Soon"
- [ ] Use FSMEmptyState widget
- [ ] Add calendar icon
- [ ] Add "Coming Soon" title
- [ ] Add description message

### 3.5 AI Chatbot Placeholder
- [ ] Create `chatbot_page.dart`
- [ ] Add "AI Assistant" AppBar
- [ ] Add robot/AI icon (64dp)
- [ ] Add "AI Assistant" title
- [ ] Add "Coming Soon" subtitle
- [ ] Add description text
- [ ] Add suggested actions cards
- [ ] Update `app_router.dart` with /chatbot route
- [ ] Run build_runner for router generation

---

## TESTING & QUALITY ASSURANCE

### Widget Tests
- [ ] Test priority_indicator widget
- [ ] Test quick_action_button widget
- [ ] Test metadata_row widget
- [ ] Test updated status_badge widget
- [ ] Test updated offline_banner widget
- [ ] Test fsm_drawer widget
- [ ] Test ai_chatbot_fab widget
- [ ] Test current_wo_card widget
- [ ] Test status_summary_grid widget
- [ ] Test work_order_list widgets
- [ ] Test document_grid_card widget
- [ ] Test parts widgets
- [ ] Test profile widgets

### BLoC Tests
- [ ] Test refactored NavigationBloc
- [ ] Test refactored DashboardBloc
- [ ] Test updated DocumentsBloc
- [ ] Test updated PartsBloc
- [ ] Test updated ProfileBloc

### Integration Tests
- [ ] Test drawer navigation flow
- [ ] Test bottom nav tab switching
- [ ] Test AI chatbot FAB navigation
- [ ] Test dashboard status filter
- [ ] Test dashboard tab switching
- [ ] Test document filtering
- [ ] Test parts category switching

### Visual Testing
- [ ] Verify colors match spec on all screens
- [ ] Verify spacing matches spec
- [ ] Verify responsive behavior on different sizes
- [ ] Test animations (60fps target)
- [ ] Test accessibility (screen reader, contrast, touch targets)

---

## CODE GENERATION & BUILD

- [ ] Run `dart run build_runner build --delete-conflicting-outputs`
- [ ] Run `dart analyze` and fix all issues
- [ ] Run `flutter test` and ensure all tests pass
- [ ] Test on real devices (small, medium, large phones)

---

## FINAL CHECKLIST

- [ ] All screens match redesign specification
- [ ] Teal/Green color theme applied throughout
- [ ] All shared widgets documented
- [ ] Responsive on all phone sizes
- [ ] BLoCs refactored with clean events/states
- [ ] Navigation flows work seamlessly
- [ ] Offline banner works correctly
- [ ] Quick actions on WO cards functional
- [ ] Animations smooth (60fps)
- [ ] Accessibility requirements met
- [ ] Code passes dart analyze
- [ ] All tests passing
- [ ] Ready for PR review

---

## NOTES

- Progressive replacement: old screens remain functional until replaced
- Run code generation after each BLoC/Router change
- Test frequently on real devices
- Keep accessibility in mind throughout
- Commit frequently with descriptive messages

---

**Total Items**: 150+
**Completed**: 0
**In Progress**: Phase 1.1 (Color System Update)
**Next**: Update AppColors.dart
