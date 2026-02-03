import 'dart:io';

/// Singleton class to store application form data across screens
class ApplicationData {
  // Singleton instance
  static final ApplicationData _instance = ApplicationData._internal();

  factory ApplicationData() {
    return _instance;
  }

  ApplicationData._internal();

  // Personal Information
  String? firstName;
  String? lastName;
  String? gender;
  String? nationality;
  DateTime? dateOfBirth;
  String? phoneNumber;
  String? email;
  File? profileImage;

  // Education Background
  String? institution;
  String? degree;
  String? major;
  int? graduationYear;
  String? gpa;

  // Languages
  String? spokenLanguage;
  String? englishLevel;
  String? ieltsCertificate;

  // Work Experience
  String? workExperience;
  String? workDuration;
  String? workType;

  // Research Experience
  String? researchExperience;
  String? authors;
  String? researchField;
  String? publisher;
  String? researchLocation;

  // Award & Achievement
  String? awardAchievement;
  String? programName;
  String? organization;
  String? awardLocation;
  String? awardDescription;

  // Scholarship Preference
  String? destinationCountry;
  String? preferredUniversity;
  String? preferredDegree;
  String? preferredMajor;

  // Reference
  String? referenceFullName;
  String? referencePosition;
  String? referenceWorkPlace;
  String? referencePhone;
  String? referenceEmail;

  /// Clear all data (useful for resetting the form)
  void clearAll() {
    firstName = null;
    lastName = null;
    gender = null;
    nationality = null;
    dateOfBirth = null;
    phoneNumber = null;
    email = null;
    profileImage = null;
    institution = null;
    degree = null;
    major = null;
    graduationYear = null;
    gpa = null;
    spokenLanguage = null;
    englishLevel = null;
    ieltsCertificate = null;
    workExperience = null;
    workDuration = null;
    workType = null;
    researchExperience = null;
    authors = null;
    researchField = null;
    publisher = null;
    researchLocation = null;
    awardAchievement = null;
    programName = null;
    organization = null;
    awardLocation = null;
    awardDescription = null;
    destinationCountry = null;
    preferredUniversity = null;
    preferredDegree = null;
    preferredMajor = null;
    referenceFullName = null;
    referencePosition = null;
    referenceWorkPlace = null;
    referencePhone = null;
    referenceEmail = null;
  }

  /// Clear only personal information
  void clearPersonalInfo() {
    firstName = null;
    lastName = null;
    gender = null;
    nationality = null;
    dateOfBirth = null;
    phoneNumber = null;
    email = null;
    profileImage = null;
  }

  /// Clear only education background
  void clearEducation() {
    institution = null;
    degree = null;
    major = null;
    graduationYear = null;
    gpa = null;
  }

  /// Clear only languages
  void clearLanguages() {
    spokenLanguage = null;
    englishLevel = null;
    ieltsCertificate = null;
  }

  /// Clear only work experience
  void clearWorkExperience() {
    workExperience = null;
    workDuration = null;
    workType = null;
  }

  /// Clear only research experience
  void clearResearchExperience() {
    researchExperience = null;
    authors = null;
    researchField = null;
    publisher = null;
    researchLocation = null;
  }

  /// Clear only award & achievement
  void clearAwardAchievement() {
    awardAchievement = null;
    programName = null;
    organization = null;
    awardLocation = null;
    awardDescription = null;
  }

  /// Clear only scholarship preference
  void clearScholarshipPreference() {
    destinationCountry = null;
    preferredUniversity = null;
    preferredDegree = null;
    preferredMajor = null;
  }

  /// Clear only reference
  void clearReference() {
    referenceFullName = null;
    referencePosition = null;
    referenceWorkPlace = null;
    referencePhone = null;
    referenceEmail = null;
  }
}