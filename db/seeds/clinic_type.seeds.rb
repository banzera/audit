return unless ClinicType.none?

ClinicType.create(name: 'Oral Surgery')
ClinicType.create(name: 'Family Dental')
ClinicType.create(name: 'Pediatric')
ClinicType.create(name: 'Orthodontic')
