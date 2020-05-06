USE project2;
CREATE TABLE Physician (   
  PhysicianID INTEGER PRIMARY KEY NOT NULL,   
  Name TEXT NOT NULL,   
  Position TEXT NOT NULL,   
  SSN INTEGER NOT NULL );

CREATE TABLE Department ( 
  DepartmentID INTEGER PRIMARY KEY NOT NULL,   
  Name TEXT NOT NULL,   
  Head INTEGER NOT NULL, 
  FOREIGN KEY(Head) REFERENCES Physician(PhysicianID) ON DELETE CASCADE 
);

CREATE TABLE Patient (
  SSN INTEGER PRIMARY KEY NOT NULL ,
  Name TEXT NOT NULL,
  Address TEXT NOT NULL,
  Phone TEXT NOT NULL,
  InsuranceID INTEGER NOT NULL
);

CREATE TABLE Nurse (
  NurseID INTEGER PRIMARY KEY NOT NULL,
  Name TEXT NOT NULL,
  Position TEXT NOT NULL,
  Registered BOOLEAN NOT NULL,
  SSN INTEGER NOT NULL
);

CREATE TABLE Affiliated_With (
  Physician INTEGER NOT NULL,
  Department INTEGER NOT NULL,
  PrimaryAffiliation BOOLEAN NOT NULL,
  PRIMARY KEY(Physician, Department),
  FOREIGN KEY(Physician) REFERENCES Physician(PhysicianID) ON DELETE CASCADE,
  FOREIGN KEY(Department) REFERENCES Department(DepartmentID) ON DELETE CASCADE
);

CREATE TABLE Appointment (
  AppointmentID INTEGER PRIMARY KEY NOT NULL,
  Patient INTEGER NOT NULL,
  PrepNurse INTEGER,
  Physician INTEGER NOT NULL,
  Start DATETIME NOT NULL,
  End DATETIME NOT NULL,
  FOREIGN KEY(Patient) REFERENCES Patient(SSN) ON DELETE CASCADE,
  FOREIGN KEY(PrepNurse) REFERENCES Nurse(NurseID) ON DELETE CASCADE,
  FOREIGN KEY(Physician) REFERENCES Physician(PhysicianID) ON DELETE CASCADE
);

