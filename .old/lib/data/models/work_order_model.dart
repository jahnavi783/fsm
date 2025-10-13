class Appointment {
  final int requestId;
  final int? appointmentId;
  final String status;
  final String priority;
  final int? workOrderId;

  Appointment({
    required this.requestId,
    required this.appointmentId,
    required this.status,
    required this.priority,
    required this.workOrderId,
  });

  factory Appointment.fromJson(Map<String, dynamic> json) {
    return Appointment(
      requestId: json['request_id'],
      appointmentId: json['appointment_id'] ?? 0,
      status: json['status'],
      priority: json['priority'],
      workOrderId: json['work_order_id'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'request_id': requestId,
      'appointment_id': appointmentId ?? 0,
      'status': status,
      'priority': priority,
      'work_order_id': workOrderId ?? 0,
    };
  }
}
