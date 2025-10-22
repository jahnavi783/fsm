/// Seed database test user credentials
/// These users are created by running `npm run seed` on the backend
class TestUsers {
  // Technician (FSE) - Primary test user
  static const String technicianEmail = 'michael.clark.fse@fsm.com';
  static const String technicianPassword = '123456';
  static const int technicianUserId = 4;
  static const String technicianRole = 'technician';

  // Manager - For admin operations
  static const String managerEmail = 'manager.houston@fsm.com';
  static const String managerPassword = '123456';
  static const int managerUserId = 2;
  static const String managerRole = 'manager';

  // Helpdesk Agent - For SR/WO creation
  static const String helpdeskEmail = 'helpdesk.midland@fsm.com';
  static const String helpdeskPassword = '123456';
  static const int helpdeskUserId = 3;
  static const String helpdeskRole = 'helpdesk';

  // Super Admin - For system-wide operations
  static const String superAdminEmail = 'superadmin@fsm.com';
  static const String superAdminPassword = '123456';
  static const int superAdminUserId = 1;
  static const String superAdminRole = 'super_admin';
}

/// Seeded Work Order data for testing
/// Reference: docs/api.md - Seeded Service Requests & Work Orders
class TestWorkOrders {
  // WO1 - SR-202510-1000-WO01: Emergency Motor Replacement (In Progress)
  // Assigned to: Michael Clark (Technician)
  // Started: Yesterday, still ongoing
  static const int wo1Id = 1;
  static const String wo1Number = 'SR-202510-1000-WO01';
  static const String wo1Status = 'in_progress';
  static const int wo1AssignedTo = TestUsers.technicianUserId;
  static const String wo1Summary = 'Emergency Motor Replacement';
  static const double wo1DurationHours = 12.0;

  // WO2 - SR-202510-1000-WO02: Motor Alignment and Testing (Paused)
  // Assigned to: Michael Clark (Technician)
  // Paused: Waiting for specialized alignment tools
  static const int wo2Id = 2;
  static const String wo2Number = 'SR-202510-1000-WO02';
  static const String wo2Status = 'paused';
  static const int wo2AssignedTo = TestUsers.technicianUserId;
  static const String wo2Summary = 'Motor Alignment and Testing';
  static const double wo2DurationHours = 6.0;
  static const String wo2PauseReason = 'Waiting for specialized alignment tools';

  // WO3 - SR-202510-1001-WO01: Quarterly Hydraulic System Maintenance (Assigned)
  // Assigned to: Emma Lewis (different technician)
  // Scheduled: Tomorrow
  static const int wo3Id = 3;
  static const String wo3Number = 'SR-202510-1001-WO01';
  static const String wo3Status = 'assigned';
  static const String wo3Summary = 'Quarterly Hydraulic System Maintenance';
  static const double wo3DurationHours = 8.0;

  // WO4 - SR-202510-1001-WO02: Hydraulic Fluid Analysis and Replacement (Assigned)
  // Assigned to: Emma Lewis (different technician)
  static const int wo4Id = 4;
  static const String wo4Number = 'SR-202510-1001-WO02';
  static const String wo4Status = 'assigned';

  // WO5 - SR-202510-1003-WO01: Compressor Valve Replacement (Assigned)
  // Assigned to: Olivia Rodriguez (different technician)
  static const int wo5Id = 5;
  static const String wo5Number = 'SR-202510-1003-WO01';
  static const String wo5Status = 'assigned';

  // WO6 - SR-202510-1004-WO01: Monthly Wellhead Inspection (Completed)
  // Assigned to: Michael Clark (Technician)
  // Completed: 3 days ago
  static const int wo6Id = 6;
  static const String wo6Number = 'SR-202510-1004-WO01';
  static const String wo6Status = 'completed';
  static const int wo6AssignedTo = TestUsers.technicianUserId;
  static const String wo6Summary = 'Monthly Wellhead Inspection';
  static const double wo6DurationHours = 4.0;
  static const double wo6ActualDurationHours = 4.5;

  // Test GPS coordinates (Houston, TX)
  static const double testLatitude = 29.7604;
  static const double testLongitude = -95.3698;
  static const String testGpsCoordinates = '[-95.3698, 29.7604]'; // [longitude, latitude]
}

/// Seeded Service Request data
class TestServiceRequests {
  static const int sr1Id = 1;
  static const String sr1Number = 'SR-202510-1000';
  static const String sr1Status = 'In Progress';
  static const String sr1CustomerName = 'John Davis';
  static const String sr1CustomerEmail = 'john.davis@apexenergy.com';
}
