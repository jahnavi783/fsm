// ═══════════════════════════════════════════════════════════════════════════
// FSM Widget Library - Barrel File
// ═══════════════════════════════════════════════════════════════════════════
// Exports all core widgets organized by functional category.
// Import this file to access the entire FSM widget library.

// ───────────────────────────────────────────────────────────────────────────
// States - Empty, Error, and Loading States
// ───────────────────────────────────────────────────────────────────────────
export 'states/fsm_empty_state.dart';
export 'states/fsm_error_state.dart';
export 'states/fsm_loading_indicator.dart';
export 'states/fsm_shimmer_loading.dart';

// ───────────────────────────────────────────────────────────────────────────
// Cards - Card Components
// ───────────────────────────────────────────────────────────────────────────
export 'cards/fsm_card.dart';
export 'cards/fsm_list_card.dart';
export 'cards/fsm_stats_card.dart';

// ───────────────────────────────────────────────────────────────────────────
// Lists - List and Grid Components
// ───────────────────────────────────────────────────────────────────────────
export 'lists/fsm_list_item.dart';
export 'lists/fsm_lazy_loading_list.dart';

// ───────────────────────────────────────────────────────────────────────────
// Buttons - Button Components
// ───────────────────────────────────────────────────────────────────────────
export 'buttons/fsm_button.dart';
export 'buttons/fsm_action_button.dart';
export 'buttons/fsm_quick_action_button.dart';

// ───────────────────────────────────────────────────────────────────────────
// Navigation - Navigation Components
// ───────────────────────────────────────────────────────────────────────────
export 'navigation/fsm_drawer.dart';
export 'navigation/fsm_tab_bar.dart';
export 'navigation/fsm_bottom_sheet.dart';

// ───────────────────────────────────────────────────────────────────────────
// Inputs - Search and Filter Components
// ───────────────────────────────────────────────────────────────────────────
export 'inputs/fsm_search_bar.dart';
export 'inputs/fsm_filter_chip_group.dart';

// ───────────────────────────────────────────────────────────────────────────
// Layout - Layout Helper Components
// ───────────────────────────────────────────────────────────────────────────
export 'layout/fsm_section_header.dart';
export 'layout/fsm_info_row.dart';
export 'layout/fsm_metadata_row.dart';

// ───────────────────────────────────────────────────────────────────────────
// Feedback - Status and Priority Indicators
// ───────────────────────────────────────────────────────────────────────────
export 'feedback/fsm_status_badge.dart';
export 'feedback/fsm_priority_indicator.dart';

// ───────────────────────────────────────────────────────────────────────────
// Connectivity - Network Status Components
// ───────────────────────────────────────────────────────────────────────────
export 'connectivity/fsm_offline_banner.dart';
export 'connectivity/fsm_connectivity_indicator.dart';
export 'connectivity/fsm_sync_indicator.dart';

// ───────────────────────────────────────────────────────────────────────────
// Media - Image and Media Components
// ───────────────────────────────────────────────────────────────────────────
export 'media/fsm_optimized_image.dart';

// ───────────────────────────────────────────────────────────────────────────
// Error Boundary - Error Handling Components
// ───────────────────────────────────────────────────────────────────────────
export 'error_boundary/error_boundary_widget.dart';
export 'error_boundary/error_handler.dart';

// ───────────────────────────────────────────────────────────────────────────
// Form Components - Reactive Form Widgets
// ───────────────────────────────────────────────────────────────────────────
export 'form/location_status_widget.dart';
export 'form/reactive_image_picker.dart';
export 'form/reactive_multiline_input.dart';
export 'form/reactive_signature_pad.dart';
export 'form/reactive_text_input.dart';
export 'form/reactive_file_control.dart';
export 'form/reactive_signature_control.dart';
export 'form/work_order_validators.dart';

// ───────────────────────────────────────────────────────────────────────────
// Legacy/Root Level Widgets (To be migrated or deprecated)
// ───────────────────────────────────────────────────────────────────────────
// TODO: These widgets are still in the root widgets/ folder
// They should be moved to features/ or deprecated
export 'ai_chatbot_fab.dart';
export 'fsm_app_bar.dart';
export 'optimized_splash_screen.dart';
export 'work_order_sliver_list.dart';
