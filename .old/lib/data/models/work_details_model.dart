class WorkDetailsModel {
  final String message;
  final List<ServiceJobData> data;

  WorkDetailsModel({required this.message, required this.data});

  factory WorkDetailsModel.fromJson(Map<String, dynamic> json) {
    var list = json['data'] as List;
    List<ServiceJobData> dataList =
        list.map((i) => ServiceJobData.fromJson(i)).toList();

    return WorkDetailsModel(
      message: json['message'],
      data: dataList,
    );
  }
}

class ServiceJobData {
  final ServiceJob serviceJob;
  final Description description;
  final Contact contact;
  final JobHistory jobHistory;
  final OtherDetails otherDetails;

  ServiceJobData({
    required this.serviceJob,
    required this.description,
    required this.contact,
    required this.jobHistory,
    required this.otherDetails,
  });

  factory ServiceJobData.fromJson(Map<String, dynamic> json) {
    return ServiceJobData(
      serviceJob: ServiceJob.fromJson(json['service_job']),
      description: Description.fromJson(json['description']),
      contact: Contact.fromJson(json['contact']),
      jobHistory: JobHistory.fromJson(json['job_history']),
      otherDetails: OtherDetails.fromJson(json['other_details']),
    );
  }
}

class ServiceJob {
  final int ticketId;
  final int workOrderId;
  final String priority;
  final String serviceType;
  final String status;

  ServiceJob({
    required this.ticketId,
    required this.workOrderId,
    required this.priority,
    required this.serviceType,
    required this.status,
  });

  factory ServiceJob.fromJson(Map<String, dynamic> json) {
    return ServiceJob(
      ticketId: json['ticket_id'],
      workOrderId: json['work_order_id'],
      priority: json['priority'],
      serviceType: json['service_type'],
      status: json['status'],
    );
  }
}

class Description {
  final String description;
  final String symptomNotes;

  Description({required this.description, required this.symptomNotes});

  factory Description.fromJson(Map<String, dynamic> json) {
    return Description(
      description: json['description'],
      symptomNotes: json['symptom_notes'],
    );
  }
}

class Contact {
  final String city;
  final String state;
  final String postalCode;
  final String landmark;

  Contact({
    required this.city,
    required this.state,
    required this.postalCode,
    required this.landmark,
  });

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
      city: json['city'],
      state: json['state'],
      postalCode: json['postal_code'],
      landmark: json['landmark'],
    );
  }
}

class JobHistory {
  final String scheduledTime;
  final String appointmentStatus;
  final String workOrderStatus;
  final String commentBySupervisor;
  final String partsDetails;
  final String? startDateTime;
  final String? endDateTime;
  final String? pauseDateTime;
  final String? resumeDateTime;
  final CommentByFse commentByFse;

  JobHistory({
    required this.scheduledTime,
    required this.appointmentStatus,
    required this.workOrderStatus,
    required this.commentBySupervisor,
    required this.partsDetails,
    this.startDateTime,
    this.endDateTime,
    this.pauseDateTime,
    this.resumeDateTime,
    required this.commentByFse,
  });

  factory JobHistory.fromJson(Map<String, dynamic> json) {
    return JobHistory(
      scheduledTime: json['scheduled_time'],
      appointmentStatus: json['appointment_status'],
      workOrderStatus: json['work_order_status'],
      commentBySupervisor: json['comment_by_supervisor'],
      partsDetails: json['parts_details'],
      startDateTime: json['start_date_time'],
      endDateTime: json['end_date_time'],
      pauseDateTime: json['pause_date_time'],
      resumeDateTime: json['resume_date_time'],
      commentByFse: CommentByFse.fromJson(json['comment_by_fse']),
    );
  }
}

class CommentByFse {
  final String start;

  CommentByFse({required this.start});

  factory CommentByFse.fromJson(Map<String, dynamic> json) {
    return CommentByFse(
      start: json['start'],
    );
  }
}

class OtherDetails {
  final String machineName;
  final String machineModel;
  final String machineType;
  final String machineManufacturingYear;
  final String machinePurchaseDate;
  final int machineOnWarranty;
  final String dateOfCommissioning;

  OtherDetails({
    required this.machineName,
    required this.machineModel,
    required this.machineType,
    required this.machineManufacturingYear,
    required this.machinePurchaseDate,
    required this.machineOnWarranty,
    required this.dateOfCommissioning,
  });

  factory OtherDetails.fromJson(Map<String, dynamic> json) {
    return OtherDetails(
      machineName: json['machine_name'],
      machineModel: json['machine_model'],
      machineType: json['machine_type'],
      machineManufacturingYear: json['machine_manufacturing_year'],
      machinePurchaseDate: json['machine_purchase_date'],
      machineOnWarranty: json['machine_on_warranty'],
      dateOfCommissioning: json['date_of_commissioning'],
    );
  }
}
